import React from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"

import { Container, ForgotPassModalContainer, ForgotPassButtonContaier, Form, Image } from "./styles"
import Text from "../../components/Text"
import { View } from "react-native"

export default function Login({ navigation }) {
    function ForgotPassModall() {
        return (
            <ForgotPassModalContainer>
                <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" />
                <Button icon="log-in-outline" title="Entrar" onPress={() => navigation.navigate("Home")} />
            </ForgotPassModalContainer>
        )
    }

    return (
        <Container>
            <Form>
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" />
                <ForgotPassButtonContaier>
                    <Link title="Esqueceu sua senha?" onPress={() => navigation.navigate("Modal", { title: "Redefinir Senha", size: "default", content: ForgotPassModall() })} />
                </ForgotPassButtonContaier>

                <Button icon="log-in-outline" title="Entrar" onPress={() => navigation.navigate("Home")} />
            </Form>

            <Image source={require("../../../assets/icons/animals-image.png")} />
        </Container>
    )
}