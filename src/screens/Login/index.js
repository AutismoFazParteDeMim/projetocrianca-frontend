import React, { useState } from "react"
import { Text, View, Image, Alert } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import Link from "../../components/Link"
import CustomModal from "../../components/Modal/CustomModal"

import Firebase from '../../config/firebase'
import WarningModal from "../../components/Modal/WarningModal"
const auth = Firebase.auth()

function Login({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)
    const [warningModal, setWarningModal] = React.useState(false)

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [errorMessage, setErrorMessage] = useState('')

    const onLogin = async () => {
        try {
            if (email !== '' && password !== '') {
                await auth.signInWithEmailAndPassword(email, password)
            } else {
                setErrorMessage("Nehum campo pode estar vazio!")
                setWarningModal(true)
            }
        } catch (error) {
            if (error.code == "auth/invalid-email") {
                setErrorMessage("O email digitado não está correto. Verifique e digite novamente.")
            } else if (error.code == "auth/user-not-found") {
                setErrorMessage("Usuário não encontrado. Verifique seu email ou crie uma conta.")
            } else if (error.code == "auth/wrong-password") {
                setErrorMessage("A senha digitada não está correta. Verifique e digite novamente.")
            } else {
                setErrorMessage("Algo deu errado! Pedimos desculpas pelo transtorno. | " + error.code)
            }
            setWarningModal(true)
        }
    }


    return (
        <View style={styles.globalContainer}>
            <Header title="Login" navigation={navigation} />

            <View style={[styles.container]}>
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" onChangeText={text => setEmail(text)} />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Insira sua senha" onChangeText={text => setPassword(text)} />
                <View style={styles.link} >
                    <Link text="Esqueceu sua senha?" onPress={() => setShowModal(true)} />
                </View>
                <Button icon="enter-outline" iconPosition="left" title="Entrar" onPress={() => onLogin()} />
                <Image source={require('../../../assets/animais.png')} style={styles.animals} />
            </View>

            <CustomModal visible={showModal} title="Redefinição de senha" closeAction={() => setShowModal(false)}>
                <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <Button icon="send-outline" iconPosition="right" title="Enviar" onPress={() => setShowModal(false)} />
            </CustomModal>
            <WarningModal visible={warningModal} closeAction={() => setWarningModal(false)} text={errorMessage} />
        </View>
    )
}

export default Login