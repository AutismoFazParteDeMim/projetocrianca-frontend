import React, { useState } from "react"
import { Text, View, Image, Alert } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal"

import Firebase from '../../config/firebase'
const auth = Firebase.auth()

function Register({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)

    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [userName, setUserName] = useState('')

    const onHandleSignup = async () => {
        try {
            if (email !== '' && password !== '') {
                await auth.createUserWithEmailAndPassword(email, password)
                auth.signInWithEmailAndPassword(email, password)

                await auth.onAuthStateChanged(function (user) {
                    if (user) {
                        user.updateProfile({ displayName: userName })
                            .then(function () {
                                navigation.navigate("Welcome")

                            }, function (error) {
                                Alert.alert(
                                    "Error",
                                    error.message,
                                    [
                                        { text: "OK", onPress: () => console.log("OK Pressed") }
                                    ]
                                );
                            });
                    }
                });
            }
        } catch (error) {
            Alert.alert(
                "Error",
                error.message,
                [
                    { text: "OK", onPress: () => console.log("OK Pressed") }
                ]
            );
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
        </View >
    )
}

export default Register