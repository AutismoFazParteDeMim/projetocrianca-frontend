import React, { useState } from "react"
import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"

import { Modal, AlertModal, Text } from "../../components/Modals/Modal"

import { auth } from "../../config/firebase"
import { sendPasswordResetEmail, signInWithEmailAndPassword } from "firebase/auth"

import { Container, ForgotPassModalContainer, ForgotPassButtonContaier, Form, Image } from "./styles"

export default function Login() {

    const [input, setInput] = useState({
        email: "",
        password: "",
    })

    const [modal, setModal] = useState({
        modalVisible: false,
        alertWarningVisible: false,
        alertSuccessVisible: false,
        alertMessage: ""
    })

    async function logIn() {
        if (input.email === "" || input.password === "") {
            setModal({ ...modal, alertMessage: "Nenhum campo pode estar vazio!", alertWarningVisible: true })
        } else if (input.password.length < 8) {
            setModal({ ...modal, alertMessage: "A senha deve conter pelo menos 08 caracteres!", alertWarningVisible: true })
        } else {
            try {
                await signInWithEmailAndPassword(auth, input.email, input.password);
            } catch (error) {
                if (error.code === "auth/invalid-email") {
                    setModal({ ...modal, alertMessage: "Email inválido. Verifique e tente novamente!", alertWarningVisible: true })
                } else if (error.code === "auth/user-not-found") {
                    setModal({ ...modal, alertMessage: "Este email não está cadastrado. Tente novamente!", alertWarningVisible: true })
                } else if (error.code === "auth/wrong-password") {
                    setModal({ ...modal, alertMessage: "Senha incorreta. Tente novamente!", alertWarningVisible: true })

                } else {
                    setModal({ ...modal, alertMessage: error.code + ": " + error.message, alertWarningVisible: true })
                }
            }
        }
    }

    async function resetPass() {
        if (input.email === "") {
            setModal({ ...modal, alertMessage: "O campo não pode estar vazio!", alertWarningVisible: true })
        } else {
            try {
                await sendPasswordResetEmail(auth, input.email).then(() => {
                    setModal({ ...modal, alertMessage: "Email de recuperação de senha enviado. Verifique sua caixa de entrada.", alertSuccessVisible: true })
                })
            } catch (error) {
                if (error.code === "auth/invalid-email") {
                    setModal({ ...modal, alertMessage: "Email inválido. Verifique e tente novamente!", alertWarningVisible: true })
                } else if (error.code === "auth/user-not-found") {
                    setModal({ ...modal, alertMessage: "Este email não está cadastrado. Tente novamente!", alertWarningVisible: true })
                } else {
                    setModal({ ...modal, alertMessage: error.code + ": " + error.message, alertWarningVisible: true })
                }
            }
        }
    }

    return (
        <Container>
            <Form>
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" value={input.email} onChangeText={text => setInput({ ...input, email: text })} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" value={input.password} onChangeText={text => setInput({ ...input, password: text })} />
                <ForgotPassButtonContaier>
                    <Link title="Esqueceu sua senha?" onPress={() => setModal({ ...modal, modalVisible: true })} />
                </ForgotPassButtonContaier>

                <Button icon="log-in-outline" title="Entrar" onPress={() => logIn()} />
            </Form>

            <Image source={require("../../../assets/icons/animals-image.png")} />

            <Modal visible={modal.modalVisible} title="Redefinir Senha" size="default" closeAction={() => setModal({ ...modal, modalVisible: false })}>
                <ForgotPassModalContainer>
                    <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                    <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="done" value={input.email} onChangeText={text => setInput({ ...input, email: text })} />
                    <Button icon="send" title="Enviar email" onPress={() => resetPass()} inverted />
                </ForgotPassModalContainer>
            </Modal>

            <AlertModal visible={modal.alertWarningVisible} title="Ops!" text={modal.alertMessage} type="warning" icon="warning-outline" closeAction={() => setModal({ ...modal, alertWarningVisible: false })} />
            <AlertModal visible={modal.alertSuccessVisible} title="Sucesso!" text={modal.alertMessage} type="success" icon="checkmark-circle-outline" closeAction={() => setModal({ ...modal, alertSuccessVisible: false, modalVisible: false })} />
        </Container>
    )
}