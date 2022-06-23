import { useState, useEffect } from "react"
import { FlatGrid } from 'react-native-super-grid'
import { AlertModal, AvatarChat } from "../../../../components"
import { shuffleArray } from "../../../../utils"
import { TouchableOpacity } from "react-native"
import { Ionicons } from "@expo/vector-icons"
import data from "../data"

import { Container, Card, CustomHeader, CardImage } from "../styles"

export default function MemoryGame2({ navigation }) {
    const [openedCards, setOpenedCards] = useState([])
    const [round, setRound] = useState([])
    const [shuffledCards, setShuffledCards] = useState([])
    const [counter, setCounter] = useState(0)
    const [modal, setModal] = useState({
        modalVisible: false,
        alertModalVisible: false,
        alertMessage: ""
    })

    const cards = [
        {
            key: 1,
            name: "gata",
            image: require("../assets/gata.png"),
        },
        {
            key: 2,
            name: "hipopotamo",
            image: require("../assets/hipopotamo.png"),
        },
        {
            key: 3,
            name: "largaticha",
            image: require("../assets/largaticha.png"),
        },
        {
            key: 4,
            name: "pato",
            image: require("../assets/pato.png"),
        },
        {
            key: 5,
            name: "papagaio",
            image: require("../assets/papagaio.png"),
        },
        {
            key: 6,
            name: "coruja",
            image: require("../assets/coruja.png"),
        },
    ]

    useEffect(() => {
        const duplicateCards = [...cards, ...cards]
        setShuffledCards(shuffleArray(duplicateCards))
    }, [])

    useEffect(() => {
        let first = shuffledCards[openedCards[openedCards.length < 2 ? 0 : openedCards.length - 2]]
        let second = shuffledCards[openedCards[openedCards.length < 2 ? 1 : openedCards.length - 1]]

        if (second && first.key === second.key) {
            setRound([...round, first])
            setCounter(counter + 1)
        }

        if (first !== second) {
            if (openedCards.length % 2 === 0) {
                setTimeout(() => setOpenedCards(openedCards.slice(0, -2)), 1000)
                setCounter(counter + 1)
            }
        }
        if (openedCards.length === cards.length * 2) {
            setModal({ ...modal, alertMessage: "Você conseguiu completar o Jogo da Memória.", alertModalVisible: true })
        }
    }, [openedCards])

    function handleClick(index) {
        setOpenedCards((open) => [...open, index])
    }

    function renderItem({ item, index }) {
        return (
            <Card key={item.key} onPress={() => handleClick(index)}>
                {
                    openedCards.includes(index) || round.includes(item.key) ? <CardImage source={item.image} /> : <CardImage source={require("../assets/card-icon.png")} />
                }
            </Card>
        )
    }

    return (
        <>
            <CustomHeader navigation={navigation} title="Jogo da Memória">
                <TouchableOpacity onPress={() => navigation.navigate("Tutorial", { data: data })}>
                    <Ionicons name="information-circle-outline" style={{ fontSize: 30, color: "white" }} />
                </TouchableOpacity>
            </CustomHeader>
            <Container>
                <AvatarChat text="Parabéns! Você está na última fase." />
                <FlatGrid
                    data={shuffledCards}
                    renderItem={renderItem}
                    itemDimension={16}
                    spacing={16}
                    maxItemsPerRow={3}
                    contentContainerStyle={{
                        flex: 1,
                        alignItems: "center",
                        justifyContent: "flex-end"
                    }}
                />
            </Container>
            <AlertModal visible={modal.alertModalVisible} title="Parabéns!" text={modal.alertMessage} type="success" icon="checkmark-circle-outline" closeAction={() => { setModal({ ...modal, alertModalVisible: false }), navigation.navigate("Games") }} />
        </>
    )
}