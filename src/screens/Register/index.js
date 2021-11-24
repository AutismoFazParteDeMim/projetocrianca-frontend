import React, { useState, useContext } from "react"
import { Text, View, Image, KeyboardAvoidingView } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal/CustomModal"
import WarningModal from "../../components/Modal/WarningModal"
import SuccessModal from "../../components/Modal/SuccessModal"

import { auth } from '../../config/firebase'
import { ThemeContext } from "../../styles/ThemeProvider"

function Register({ navigation }) {
    const { colors } = useContext(ThemeContext)
    const [showModal, setShowModal] = useState(false)
    const [warningModal, setWarningModal] = useState(false)

    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [userName, setUserName] = useState("")
    const [errorMessage, setErrorMessage] = useState("")

    async function handleSignOut() {
        try {
            await auth.signOut();
        } catch (error) {
            setErrorMessage("Algo deu errado! Pedimos desculpas pelo transtorno. | " + error.code)
            setWarningModal(true)
        }
    }

    async function onHandleSignup() {
        try {
            if (userName.length < 3) {
                setErrorMessage("O nome deve conter pelo menos 03 letras.")
                setWarningModal(true)
            } else if (email !== "" && password !== "" && userName !== "") {
                await auth.createUserWithEmailAndPassword(email, password).then((res) => {
                    const user = res.user
                    user.updateProfile({ displayName: userName })

                    user.sendEmailVerification()

                    handleSignOut()
                })
            } else {
                setErrorMessage("Nenhum campo pode estar vazio!")
                setWarningModal(true)
            }
        } catch (error) {
            if (error.code == "auth/invalid-email") {
                setErrorMessage("O email digitado é inválido. Verifique e digite novamente.")
            } else if (error.code == "auth/weak-password") {
                setErrorMessage("Sua senha deve conter pelo menos 08 dígitos.")
            } else {
                setErrorMessage("Algo deu errado! Pedimos desculpas pelo transtorno. | " + error.code)
            }
            setWarningModal(true)
        }
    }

    return (
        <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : "height"}
            style={{ flex: 1 }}
        >
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={styles(colors).globalContainer}>
                <View style={[styles(colors).container]}>
                    <Image source={require('../../../assets/animais.png')} style={styles(colors).image} />

                    <InputText type="name" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" autoCapitalize="words" onChangeText={text => setUserName(text)} style={styles(colors).input} />
                    <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" onChangeText={text => setEmail(text)} style={styles(colors).input} />
                    <InputPass type="password" icon="lock-closed-outline" placeholder="Crie uma senha" onChangeText={text => setPassword(text)} style={styles(colors).input} />

                    <Button icon="arrow-forward-outline" iconPosition="right" title="Próximo" onPress={() => setShowModal(true)} />
                </View>

                <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                    <Text style={styles(colors).globalText}>Qual o nome da criança? Essa informação será útil para personalizar a experiência!</Text>
                    <InputText type="name" icon="person-circle-outline" placeholder="Insira o nome e sobrenome" autoCapitalize="words" />
                    <Button icon="checkmark-circle-outline" iconPosition="left" title="Concluído" onPress={() => onHandleSignup()} />
                </CustomModal>
                <WarningModal visible={warningModal} closeAction={() => setWarningModal(false)} text={errorMessage} />
            </View>
        </KeyboardAvoidingView >
    )
}

export default Register