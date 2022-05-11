import React, { useEffect, useState } from "react"
import { SvgXml } from "react-native-svg"
import { Platform } from "react-native"

import { Button, Text } from "../../../components"

import { Container, StyleItem, StylesContainer, StylesRow, HairImage } from "./styles"
import { getAvatar } from "../api"

import { firestore } from "../../../config/firebase"
import { updateDoc, doc } from "firebase/firestore"
import { firstTime } from "../../../redux/modules/settings/actions"
import { useSelector, useDispatch } from "react-redux"

export default function Avatar({ route, navigation }) {
    const { params } = route.params
    const { user } = useSelector(state => state.user)
    const dispatch = useDispatch();
    const [avatar, setAvatar] = useState() //svg do avatar
    const [seed, setSeed] = useState({ ...params })

    useEffect(() => {
        const getData = async () => {
            let data = await getAvatar(seed)
            setAvatar(data.data)
        }

        getData()
    }, [seed])

    async function setChildPic() {
        await updateDoc(doc(firestore, "users", user.uid), {
            childPic: avatar
        }).then(() => {
            dispatch(firstTime(false))
            navigation.navigate("Profile")
        })
    }

    const categorias = [
        {
            name: "Tipos de Olhos",
            param: "eyes",
            colors: [
                { name: "normal", image: require("../assets/eye/normalEyes.png") },
                { name: "cheery", image: require("../assets/eye/cheeryEyes.png") },
                { name: "winking", image: require("../assets/eye/winkingEyes.png") },
                { name: "confused", image: require("../assets/eye/confusedEyes.png") },
                { name: "sleepy", image: require("../assets/eye/sleepyEyes.png") },
                { name: "starstruck", image: require("../assets/eye/starstruckEyes.png") },
            ]
        },
        {
            name: "Acessórios",
            param: "accessories",
            colors: [
                { name: "catEars", image: require("../assets/objects/catEars.png") },
                { name: "clownNose", image: require("../assets/objects/clownNose.png") },
                { name: "faceMask", image: require("../assets/objects/faceMask.png") },
                { name: "glasses", image: require("../assets/objects/glasses.png") },
                { name: "sunglasses", image: require("../assets/objects/sunglasses.png") },
                { name: "sailormoonCrown", image: require("../assets/objects/sailormoonCrown.png") },
            ]
        },
        {
            name: "Tipos de Sorriso",
            param: "mouth",
            colors: [
                { name: "awkwardSmile", image: require("../assets/smile/awkwardSmile.png") },
                { name: "braces", image: require("../assets/smile/braces.png") },
                { name: "gapSmile", image: require("../assets/smile/gapSmile.png") },
                { name: "kawaii", image: require("../assets/smile/kawaii.png") },
                { name: "openedSmile", image: require("../assets/smile/openedSmile.png") },
                { name: "teethSmile", image: require("../assets/smile/teethSmile.png") },
            ]
        }
    ]

    return (
        <Container>
            {avatar && Platform.OS === "web" ? <svg xmlns={avatar} width={160} height={160} /> : avatar && <SvgXml xml={avatar} width={160} height={160} />}
            {
                categorias.map(categoria =>
                    <StylesContainer key={categoria.name}>
                        <Text>{categoria.name}</Text>
                        <StylesRow>
                            {
                                categoria.colors.map(item =>
                                    <StyleItem key={item.param} onPress={() => setSeed({
                                        ...seed,
                                        ...categoria.param === "eyes" ? { eyes: item.name }
                                            : categoria.param === "accessories" ? { accessories: item.name, accessoriesProbability: 100 }
                                                : categoria.param === "mouth" ? { mouth: item.name }
                                                    : null
                                    })}>
                                        <HairImage source={item.image} />
                                    </StyleItem>
                                )
                            }
                        </StylesRow>
                    </StylesContainer>
                )
            }

            <Button title="Salvar" icon="save" onPress={() => setChildPic()} />
        </Container>
    )
}