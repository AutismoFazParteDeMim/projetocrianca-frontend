import React, { useState } from "react"
import { Text, View, Image, Alert } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal/CustomModal"
import WarningModal from "../../components/Modal/WarningModal"

import Firebase from '../../config/firebase'
const auth = Firebase.auth()

function Register({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)
    const [warningModal, setWarningModal] = React.useState(false)

    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [userName, setUserName] = useState("")
    const [errorMessage, setErrorMessage] = useState("")

    const onHandleSignup = async () => {
        try {
            if (email !== "" && password !== "" && userName !== "") {
                await auth.createUserWithEmailAndPassword(email, password)
                auth.signInWithEmailAndPassword(email, password)

                await auth.onAuthStateChanged(function (user) {
                    if (user) {
                        user.updateProfile({ displayName: userName })
                            .then(function () {
                                navigation.navigate("Welcome")

                            }, function (error) {
                                setErrorMessage("Algo deu errado! Pedimos desculpas pelo transtorno. | " + error.code)
                                setWarningModal(true)
                            });
                    }
                });
            } else {
                setErrorMessage("Nenhum campo pode estar vazio!")
                setWarningModal(true)
            }
        } catch (error) {
            if (error.code == "auth/invalid-email") {
                setErrorMessage("O email digitado não está correto. Verifique e digite novamente.")
            } else {
                setErrorMessage("Algo deu errado! Pedimos desculpas pelo transtorno. | " + error.code)
            }
            setWarningModal(true)
        }
    }

    return (
        <View style={[styles.globalContainer]}>
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={[styles.container]}>
                <Image source={require('../../../assets/animais.png')} style={styles.image} />

                <InputText type="name" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" autoCapitalize="words" onChangeText={text => setUserName(text)} />
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" onChangeText={text => setEmail(text)} />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Crie uma senha" onChangeText={text => setPassword(text)} />
                <Button icon="arrow-forward-outline" iconPosition="right" title="Próximo" onPress={() => onHandleSignup() /*setShowModal(true)*/} />
            </View>

            <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                <Text>Qual o nome da criança? Essa informação será útil para personalizar a experiência!</Text>
                <InputText type="name" icon="person-circle-outline" placeholder="Insira o nome e sobrenome" autoCapitalize="words" />
                <Button icon="checkmark-circle-outline" iconPosition="left" title="Concluído" onPress={() => navigation.navigate("Welcome")} />
            </CustomModal>
            <WarningModal visible={warningModal} closeAction={() => setWarningModal(false)} text={errorMessage} />
        </View >
    )
}

export default Register