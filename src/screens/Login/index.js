import React, { useState } from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"

import { Container, ForgotPassModalContainer, ForgotPassButtonContaier, Form, Image } from "./styles"
import Text from "../../components/Text"
import Modal from "../../components/Modals/Modal"
import AlertModal from "../../components/Modals/AlertModal"

import { auth } from "../../config/firebase"
import { signInWithEmailAndPassword } from "firebase/auth"

export default function Login({ navigation }) {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [errorMessage, setErrorMessage] = useState("")

    const [modalVisible, setModalVisible] = useState(false)
    const [alertModalVisible, setAlertModalVisible] = useState(false)


    async function logIn() {
        if (email === "" || password === "") {
            setErrorMessage("Nenhum campo pode estar vazio!")
            setAlertModalVisible(true)
        } else if (password.length < 8) {
            setErrorMessage("A senha deve conter pelo menos 08 caracteres!")
            setAlertModalVisible(true)
        } else {
            try {
                await signInWithEmailAndPassword(auth, email, password);
            } catch (error) {
                if (error.code === "auth/invalid-email") {
                    setErrorMessage("Email inválido. Verifique e tente novamente!")
                } else if (error.code === "auth/user-not-found") {
                    setErrorMessage("Este email não está cadastrado. Tente novamente!")
                } else if (error.code === "auth/wrong-password") {
                    setErrorMessage("Senha incorreta. Tente novamente!")

                } else {
                    setErrorMessage(error.code + ": " + error.message)
                }

                setAlertModalVisible(true)
            }
        }
    }

    return (
        <Container>
            <Form>
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" onChangeText={setEmail} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" onChangeText={setPassword} />
                <ForgotPassButtonContaier>
                    <Link title="Esqueceu sua senha?" onPress={() => setModalVisible(true)} />
                </ForgotPassButtonContaier>

                <Button icon="log-in-outline" title="Entrar" onPress={() => logIn()} />
            </Form>

            <Image source={require("../../../assets/icons/animals-image.png")} />

            <Modal visible={modalVisible} title="Redefinir Senha" size="default" closeAction={() => setModalVisible(false)}>
                <ForgotPassModalContainer>
                    <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                    <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" />
                    <Button icon="log-in-outline" title="Entrar" onPress={() => navigation.navigate("Home")} />
                </ForgotPassModalContainer>
            </Modal>
            <AlertModal visible={alertModalVisible} title="Ops!" text={errorMessage} type="warning" icon="warning-outline" closeAction={() => setAlertModalVisible(false)} />
        </Container>
    )
}