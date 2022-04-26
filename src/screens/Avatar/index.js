import React, { useEffect, useState } from "react"
import { Container, Image, Buttom } from "./styles"
import Text from "../../components/Text"

export default function Avatar({ navigation }) {
    const [sex, setSex] = useState()

    function onChoice(value) {
        setSex(value)
        navigation.navigate("CustomAvatar")
    }

    return (
        <Container>
            <Buttom onPress={() => onChoice("female")}>
                <Image source={require("./assets/AvatarF.png")} />
                <Text>Feminino</Text>
            </Buttom>
            <Buttom onPress={() => onChoice("male")}>
                <Image source={require("./assets/AvatarM.png")} />
                <Text>Masculino</Text>
            </Buttom>
        </Container>
    )
}