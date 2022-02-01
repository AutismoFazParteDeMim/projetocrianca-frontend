import React from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import { Container, Form, Image } from "./styles"
import { Platform } from "react-native"

export default function Register({ navigation }) {
    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Image source={require("../../../assets/icons/animals-image.png")} />
            <Form>
                <TextInput icon="person-outline" placeholder="Insira seu nome completo" autoComplete="name" autoCapitalize="words" returnKeyType="next" />
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="next" />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Confirme sua senha" returnKeyType="done" />

                <Button icon="arrow-forward" title="Próximo" onPress={() => navigation.navigate("Home")} inverted/>
            </Form>
        </Container>
    )
}