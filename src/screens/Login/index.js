import React, { useState } from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"

import { Container, ForgotPassModalContainer, ForgotPassButtonContaier, Form, Image } from "./styles"
import Text from "../../components/Text"

import { auth } from "../../config/firebase"
import { signInWithEmailAndPassword } from "firebase/auth"

export default function Login({ navigation }) {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    async function logIn() {
        if (email === "" || password === "") {
            navigation.navigate("AlertModal", { title: "Ops!", text: "Nenhum campo pode estar vazio!", type: "warning", icon: "warning-outline" })
        } else if (password.length < 8) {
            navigation.navigate("AlertModal", { title: "Ops!", text: "A senha deve conter pelo menos 08 caracteres!", type: "warning", icon: "warning-outline" })
        } else {
            try {
                await signInWithEmailAndPassword(auth, email, password);
            } catch (error) {
                if (error.code === "auth/invalid-email") {
                    navigation.navigate("AlertModal", { title: "Ops!", text: "Email inválido. Verifique e tente novamente!", type: "warning", icon: "warning-outline" })
                } else if (error.code === "auth/user-not-found") {
                    navigation.navigate("AlertModal", { title: "Ops!", text: "Este email não está cadastrado. Tente novamente!", type: "warning", icon: "warning-outline" })
                } else if (error.code === "auth/wrong-password") {
                    navigation.navigate("AlertModal", { title: "Ops!", text: "Senha incorreta. Tente novamente!", type: "warning", icon: "warning-outline" })
                } else {
                    navigation.navigate("AlertModal", { title: "Algo deu errado!", text: error.code + ": " + error.message, type: "danger", icon: "warning-outline" })
                }
            }
        }
    }

    function ForgotPassModal() {
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
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" onChangeText={setEmail} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" onChangeText={setPassword} />
                <ForgotPassButtonContaier>
                    <Link title="Esqueceu sua senha?" onPress={() => navigation.navigate("Modal", { title: "Redefinir Senha", size: "default", content: ForgotPassModal() })} />
                </ForgotPassButtonContaier>

                <Button icon="log-in-outline" title="Entrar" onPress={() => logIn()} />
            </Form>

            <Image source={require("../../../assets/icons/animals-image.png")} />
        </Container>
    )
}