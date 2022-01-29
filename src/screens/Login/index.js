import React from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"

import { Container, ForgotPassContaier, Form, Image } from "./styles"

export default function Login({ navigation }) {
    return (
        <Container >
            <Form>
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" />
                <ForgotPassContaier>
                    <Link title="Esqueceu sua senha?" />
                </ForgotPassContaier>

                <Button icon="log-in-outline" title="Entrar" onPress={() => navigation.navigate("Home")} />
            </Form>

            <Image source={require("../../../assets/icons/animals-image.png")} />
        </Container>
    )
}