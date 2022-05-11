import React, { useEffect, useState } from "react"
import { SvgXml } from "react-native-svg"
import { Platform } from "react-native"

import { Button, Text } from "../../components"

import { Container, StyleItem, StylesContainer, StylesRow, HairImage } from "./styles"
import { getAvatar } from "./api"

export default function Avatar({ navigation }) {
    const [avatar, setAvatar] = useState() //svg do avatar
    const [seed, setSeed] = useState({
        accessories: "glasses",
        accessoriesProbability: 0,
        eyes: "normal",
        mouth: "openedSmile",
        skinColor: "variant01",
        hair: "shortHair",
        hairColor: "variant01",
    })

    useEffect(() => {
        const getData = async () => {
            let data = await getAvatar(seed)
            setAvatar(data.data)
        }

        getData()
    }, [seed])

    const categorias = [
        {
            name: "Tons de Pele",
            param: "skin",
            colors: [
                { name: "variant01", color: "#ffe4c0" },
                { name: "variant02", color: "#f5d7b1" },
                { name: "variant04", color: "#e2ba87" },
                { name: "variant05", color: "#c99c62" },
                { name: "variant07", color: "#8c5a2b" },
                { name: "variant08", color: "#643d19" },
            ],
        },
        {
            name: "Tipos de Cabelo",
            param: "hair",
            colors: [
                { name: "froBun", image: require("./assets/hair/froBun.png") },
                { name: "straightHair", image: require("./assets/hair/straightHair.png") },
                { name: "wavyBob", image: require("./assets/hair/wavyBob.png") },
                { name: "curlyShortHair", image: require("./assets/hair/shortHairCurly.png") },
                { name: "shortHair", image: require("./assets/hair/shortHair.png") },
                { name: "bowlCutHair", image: require("./assets/hair/bowlCutHair.png") },
            ]
        },
        {
            name: "Cores de Cabelo",
            param: "hairColor",
            colors: [
                { name: "variant01", color: "#220f00" },
                { name: "variant02", color: "#3a1a00" },
                { name: "variant03", color: "#71472d" },
                { name: "variant04", color: "#e2ba87" },
                { name: "variant08", color: "#e9b729" },
                { name: "variant07", color: "#d56c0c" },
            ]
        }
    ]

    return (
        <Container>
            {avatar && Platform.OS === "web" ? <img /> : avatar && <SvgXml xml={avatar} width={160} height={160} />}
            {
                categorias.map(categoria =>
                    <StylesContainer key={categoria.name}>
                        <Text>{categoria.name}</Text>
                        <StylesRow>
                            {
                                categoria.colors.map(item =>
                                    <StyleItem key={item.param} color={item.color} image={item.image} onPress={() => setSeed({
                                        ...seed,
                                        ...categoria.param === "skin" ? { skinColor: item.name }
                                            : categoria.param === "hair" ? { hair: item.name }
                                                : categoria.param === "hairColor" ? { hairColor: item.name }
                                                    : null
                                    })}>
                                        {

                                            categoria.param === "hair" && <HairImage source={item.image} />
                                        }
                                    </StyleItem>
                                )
                            }
                        </StylesRow>
                    </StylesContainer>
                )
            }
            <Button title="Próximo" onPress={() => navigation.navigate("CustomAvatar", { params: seed })} icon="arrow-forward" inverted />
        </Container>
    )
}