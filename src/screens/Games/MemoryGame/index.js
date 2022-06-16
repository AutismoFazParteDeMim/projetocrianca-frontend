import React, { useState, useEffect } from "react";
import { FlatGrid } from 'react-native-super-grid';
import { AvatarChat, Text } from "../../../components";
import { shuffleArray } from "../../../utils";

import { Container, Card, CustomHeader, CardImage } from "./styles";

export default function MemoryGame({ navigation }) {
    const [openedCards, setOpenedCards] = useState([]);
    const [round, setRound] = useState([]);
    const [shuffledCards, setShuffledCards] = useState([]);
    const [counter, setCounter] = useState(0);
    const [blockPress, setBlockPress] = useState(false);
    const cards = [
        {
            key: 0,
            name: "porco",
            image: require("./assets/porco.png"),
        },
        {
            key: 1,
            name: "cabra",
            image: require("./assets/cabra.png"),
        },
        {
            key: 2,
            name: "abelha",
            image: require("./assets/abelha.png"),
        },
        {
            key: 3,
            name: "camaleao",
            image: require("./assets/camaleao.png"),
        },
        {
            key: 4,
            name: "coelho",
            image: require("./assets/coelho.png"),
        },
        {
            key: 5,
            name: "elefante",
            image: require("./assets/elefante.png"),
        }
    ]

    useEffect(() => {
        const duplicateCards = [...cards, ...cards]
        setShuffledCards(shuffleArray(duplicateCards))
    }, [])

    useEffect(() => {

        let first = shuffledCards[openedCards[openedCards.length < 2 ? 0 : openedCards.length - 2]];
        let second = shuffledCards[openedCards[openedCards.length < 2 ? 1 : openedCards.length - 1]];
        if (second && first.key === second.key) {
            setRound([...round, first])
            setCounter(counter + 1)

        }

        if (first !== second) {
            if (openedCards.length % 2 === 0) {
                setBlockPress(true)
                setTimeout(() => { setOpenedCards(openedCards.slice(0, -2)), setBlockPress(false) }, 1000);
                setCounter(counter + 1)
            }
        }
        if (openedCards.length === cards.length * 2) {
            navigation.navigate("MemoryGame2")
        }

    }, [openedCards])

    function handleClick(index) {
        if (blockPress === true) {
            return
        }

        setOpenedCards((open) => [...open, index]);


    };

    function renderItem({ item, index }) {
        return (
            <Card key={item.key} onPress={() => handleClick(index)}>
                {
                    openedCards.includes(index) || round.includes(item.key) ? <CardImage source={item.image} /> : <CardImage source={require("./assets/card-icon.png")} />
                }
            </Card>
        )
    }

    return (
        <>
            <CustomHeader navigation={navigation} title="Jogo da Memória" />
            <Container>
                <AvatarChat text="Vamos jogar?" />
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
        </>
    )
}