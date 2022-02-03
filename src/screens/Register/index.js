import React, { useState } from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import { Container, Form, Image } from "./styles"
import { Platform } from "react-native"

import { auth } from "../../config/firebase"
import { createUserWithEmailAndPassword, updateProfile, signOut } from "firebase/auth"

export default function Register({ navigation }) {
    const [name, setName] = useState("")
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [confirmPassword, setConfirmPassword] = useState("")

    async function handleSignOut() {
        try {
            await signOut(auth)
        } catch (error) {
            navigation.navigate("AlertModal", { title: "Ops!", text: error.code + ": " + error.message, type: "danger", icon: "warning-outline" })
        }
    }

    async function signIn() {
        if (name === "" || email === "" || password === "" || confirmPassword === "") {
            navigation.navigate("AlertModal", { title: "Ops!", text: "Nenhum campo pode estar vazio!", type: "warning", icon: "warning-outline" })
        } else if (password.length < 8) {
            navigation.navigate("AlertModal", { title: "Ops!", text: "A senha deve conter pelo menos 08 caracteres!", type: "warning", icon: "warning-outline" })
        } else if (password != confirmPassword) {
            navigation.navigate("AlertModal", { title: "Ops!", text: "Senhas não conferem. Verifique e tente novamente!", type: "warning", icon: "warning-outline" })
        } else {
            try {
                await createUserWithEmailAndPassword(auth, email, password).then((res) => {
                    updateProfile(res.user, { displayName: name })
                    handleSignOut()
                })
            } catch (error) {
                navigation.navigate("AlertModal", { title: "Ops!", text: error.code + ": " + error.message, type: "warning", icon: "warning-outline" })
            }
        }
    }

    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Image source={require("../../../assets/icons/animals-image.png")} />
            <Form>
                <TextInput icon="person-outline" placeholder="Insira seu nome completo" autoComplete="name" autoCapitalize="words" returnKeyType="next" onChangeText={setName} />
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" onChangeText={setEmail} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="next" onChangeText={setPassword} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Confirme sua senha" returnKeyType="done" onChangeText={setConfirmPassword} />

                <Button icon="arrow-forward" title="Próximo" onPress={() => signIn()} inverted />
            </Form>
        </Container>
    )
}