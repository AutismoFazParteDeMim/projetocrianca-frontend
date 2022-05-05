import React, { useState, useEffect } from "react";
import { FlatGrid } from 'react-native-super-grid';
import Text from "../../../components/Text";


import { Container, Card, CustomHeader, CardImage, CardImageBack } from "./styles";

export default function JogoDaMemoria({ navigation }) {
    const [cards, setCards] = useState([
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
        },
        /*{
            key: 6,
            name: "gata",
            image: require("./assets/gata.png"),
        },
        {
            key: 7,
            name: "hipopotamo",
            image: require("./assets/hipopotamo.png"),
        },
        {
            key: 8,
            name: "largaticha",
            image: require("./assets/largaticha.png"),
        },
        {
            key: 9,
            name: "pato",
            image: require("./assets/pato.png"),
        },
        {
            key: 10,
            name: "papagaio",
            image: require("./assets/papagaio.png"),
        },
        {
            key: 11,
            name: "coruja",
            image: require("./assets/coruja.png"),
        },*/
    ])

    Array.prototype.shuffle = function() {

        let indice = this.length;
        
        while(indice) {
    
            const indiceAleatorio = Math.floor(Math.random() * indice--);
            [this[indice], this[indiceAleatorio]] = 
                [this[indiceAleatorio], this[indice]];
        }
    
        return this;
    }

    useEffect(() => {
        const cardss = [...cards, ...cards]
        setShuffle(cardss.shuffle())
    }, [])

    const [openCard, setOpenCard] = useState([]);
    const [round, setRound] = useState([]);
    const [shuffle, setShuffle] = useState([]);

    useEffect(() => {
        let first = shuffle[openCard[openCard.length < 2 ? 0 : openCard.length - 2]];
        let second = shuffle[openCard[openCard.length < 2 ? 1 : openCard.length - 1]];

        if (second && first.key === second.key) {
            setRound([...round, first])
        }

        if (first !== second) {
            if (openCard.length % 2 === 0) {
                setTimeout(() => setOpenCard(openCard.slice(0, -2)), 1000);
            }

        }
    }, [openCard])

    const handleClick = (index) => {
        setOpenCard((open) => [...open, index]);
    };

    function renderItem({ item, index }) {
        return (
            <Card key={item.key} onPress={() => handleClick(index)}>
                {
                    openCard.includes(index) || round.includes(item.key) ? <CardImage source={item.image} /> : <CardImage source={require("./assets/card-icon.png")} />
                }
            </Card>
        )
    }

    return (
        <>
            <CustomHeader navigation={navigation} title="Jogo da Memória" />
            <Container>
                <Text>Count: {round.length }</Text>
                <FlatGrid
                    data={shuffle}
                    renderItem={renderItem}
                    spacing={6}
                    itemDimension={100}
                    maxItemsPerRow={3}
                />
            </Container>
        </>
    )
}