import React, { useEffect, useState } from "react"
import { TouchableOpacity, View } from "react-native"
import { SvgXml } from "react-native-svg"

import Button from "../../components/Buttons/Button"

import { Container, StyleItem, StylesContainer, StylesRow } from "./styles"
import Text from "../../components/Text"
import { getAvatar } from "./api"

export default function Avatar({ navigation }) {
    const [avatar, setAvatar] = useState()
    const [seed, setSeed] = useState({
        eyes: "normal",
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
                { name: "variant08", color: "#643d19" }
            ],
        },
        {
            name: "Tipos de Cabelo",
            param: "hair",
            colors: [
                { name: "shortHair" },
                { name: "mohawk" },
                { name: "wavyBob" },
                { name: "bowlCutHair" },
                { name: "curlyBob" },
                { name: "straightHair" },
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
            {avatar && <SvgXml width="150" height="150" xml={avatar} />}
            {
                categorias.map(categoria =>
                    <StylesContainer>
                        <Text>{categoria.name}</Text>
                        <StylesRow>
                            {
                                categoria.colors.map(item =>
                                    <StyleItem color={item.color} onPress={() => setSeed({
                                        ...seed,
                                        ...categoria.param === "skin" ? { skinColor: item.name }
                                            : categoria.param === "hair" ? { hair: item.name }
                                                : categoria.param === "hairColor" ? { hairColor: item.name }
                                                    : null
                                    })} />
                                )
                            }
                        </StylesRow>
                    </StylesContainer>
                )
            }
            <Button title="Próximo" onPress={() => navigation.navigate("CustomAvatar", { params: categorias })} icon="arrow-forward" inverted />
        </Container>
    )
}