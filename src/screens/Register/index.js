import React, { useState } from "react"
import { Platform } from "react-native"

import { Container, Form, Image, ChildsModalContainer } from "./styles"

import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Picker from "../../components/Inputs/Picker"
import Modal from "../../components/Modals/Modal"
import AlertModal from "../../components/Modals/AlertModal"

import { firestore, auth } from "../../config/firebase"
import { createUserWithEmailAndPassword, updateProfile, signOut } from "firebase/auth"
import { setDoc, doc } from "firebase/firestore"
import { NavigationContainer } from "@react-navigation/native"

export default function Register({ navigation }) {
    const [name, setName] = useState("")
    const [childName, setChildName] = useState("")
    const [childSex, setChildSex] = useState("f")
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")
    const [confirmPassword, setConfirmPassword] = useState("")
    const [errorMessage, setErrorMessage] = useState("")

    const [modalVisible, setModalVisible] = useState(false)
    const [alertModalVisible, setAlertModalVisible] = useState(false)

    async function signIn() {
        if (name === "" || email === "" || password === "" || confirmPassword === "" || childName === "" || childSex === "") {
            setErrorMessage("Nenhum campo pode estar vazio!")
            setAlertModalVisible(true)
        } else if (password.length < 8) {
            setErrorMessage("A senha deve conter pelo menos 08 caracteres!")
            setAlertModalVisible(true)
        } else if (password != confirmPassword) {
            setErrorMessage("Senhas não conferem. Verifique e tente novamente!")
            setAlertModalVisible(true)
        } else {
            try {
                await createUserWithEmailAndPassword(auth, email, password).then(async (res) => {
                    await setDoc(doc(firestore, "users", res.user.uid), {
                        childName: childName,
                        childSex: childSex,
                        childPic: "default"
                    }).then(() => {
                        updateProfile(res.user, { displayName: name })
                        handleSignOut()
                    })
                })
            } catch (error) {
                setErrorMessage(error.code + ": " + error.message)
                setAlertModalVisible(true)
            }
        }
    }

    async function handleSignOut() {
        try {
            await signOut(auth)
        } catch (error) {
            setErrorMessage(error.code + ": " + error.message)
            setAlertModalVisible(true)
        }
    }

    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Image source={require("../../../assets/icons/animals-image.png")} />
            <Form>
                <TextInput type="text" icon="person-outline" placeholder="Insira seu nome completo" autoComplete="name" autoCapitalize="words" returnKeyType="next" onChangeText={setName} />
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" onChangeText={setEmail} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="next" onChangeText={setPassword} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Confirme sua senha" returnKeyType="done" onChangeText={setConfirmPassword} />

                <Button icon="arrow-forward" title="Próximo" onPress={() => setModalVisible(true)} inverted />
            </Form>

            <Modal visible={modalVisible} title="Cadastro da Criança" size="default" closeAction={() => setModalVisible(false)}>
                <ChildsModalContainer>
                    <TextInput type="text" icon="person-outline" placeholder="Insira seu nome completo" autoComplete="name" autoCapitalize="words" returnKeyType="next" onChangeText={setChildName} />

                    <Picker icon="male-female-outline" selectedValue={childSex} onValueChange={(itemValue) => setChildSex(itemValue)}>
                        <Picker.Item label="Masculino" value="m" />
                        <Picker.Item label="Feminino" value="f" />
                    </Picker>

                    <Button icon="checkmark-circle-outline" title="Próximo" onPress={() => { setModalVisible(false); navigation.navigate("Avatar") }} />
                </ChildsModalContainer>
            </Modal>
            <AlertModal visible={alertModalVisible} title="Ops!" text={errorMessage} type="warning" icon="warning-outline" closeAction={() => setAlertModalVisible(false)} />
        </Container>
    )
}