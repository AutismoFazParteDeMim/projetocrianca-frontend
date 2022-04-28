import React, { useState } from "react"
import { Platform, TouchableOpacity, View } from "react-native"

import { Container, Form, Image, ChildsModalContainer, SexPickerContainer, SexPickerItem, SexPickerItemImage } from "./styles"

import TextInput from "../../components/Inputs/TextInput"
import Button from "../../components/Buttons/Button"
import Modal from "../../components/Modals/Modal"
import AlertModal from "../../components/Modals/AlertModal"

import { firestore, auth } from "../../config/firebase"
import { createUserWithEmailAndPassword, updateProfile, signOut, sendEmailVerification } from "firebase/auth"
import { setDoc, doc } from "firebase/firestore"
import Text from "../../components/Text"

export default function Register() {
    const [input, setInput] = useState({
        name: "",
        email: "",
        password: "",
        confirmPassword: "",
        childName: "",
        childSex: ""
    })

    const [modal, setModal] = useState({
        modalVisible: false,
        alertModalVisible: false,
        alertMessage: ""
    })

    async function signIn() {
        if (input.name === "" || input.email === "" || input.password === "" || input.confirmPassword === "" || input.childName === "" || input.childSex === "") {
            setModal({ ...modal, alertMessage: "Nenhum campo pode estar vazio!", alertModalVisible: true })
        } else if (input.password.length < 8) {
            setModal({ ...modal, alertMessage: "A senha deve conter pelo menos 08 caracteres!", alertModalVisible: true })
        } else if (input.password != input.confirmPassword) {
            setModal({ ...modal, alertMessage: "Senhas não conferem. Verifique e tente novamente!", alertModalVisible: true })
        } else {
            try {
                await createUserWithEmailAndPassword(auth, input.email, input.password).then(async (res) => {
                    await setDoc(doc(firestore, "users", res.user.uid), {
                        childName: input.childName,
                        childSex: input.childSex,
                        childPic: "default"
                    }).then(() => {
                        updateProfile(res.user, { displayName: input.name })
                        sendEmailVerification(res.user)
                        handleSignOut()
                    })
                })
            } catch (error) {
                setModal({ ...modal, alertMessage: error.code + ": " + error.message, alertModalVisible: true })
            }
        }
    }

    async function handleSignOut() {
        try {
            await signOut(auth)
        } catch (error) {
            setModal({ ...modal, alertMessage: error.code + ": " + error.message, alertModalVisible: true })
        }
    }

    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Image source={require("../../../assets/icons/animals-image.png")} />
            <Form>
                <TextInput type="text" icon="person-outline" placeholder="Insira seu nome completo" autoComplete="name" autoCapitalize="words" returnKeyType="next" value={input.name} onChangeText={text => setInput({ ...input, name: text })} />
                <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" value={input.email} onChangeText={text => setInput({ ...input, email: text })} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="next" value={input.password} onChangeText={text => setInput({ ...input, password: text })} />
                <TextInput type="password" icon="lock-closed-outline" placeholder="Confirme sua senha" returnKeyType="done" value={input.confirmPassword} onChangeText={text => setInput({ ...input, confirmPassword: text })} />

                <Button icon="arrow-forward" title="Próximo" onPress={() => setModal({ ...modal, modalVisible: true })} inverted />
            </Form>

            <Modal visible={modal.modalVisible} title="Cadastro da Criança" size="medium" closeAction={() => setModal({ ...modal, modalVisible: false })}>
                <ChildsModalContainer>
                    <TextInput type="text" icon="person-outline" placeholder="Insira o nome da criança" autoComplete="name" autoCapitalize="words" returnKeyType="next" value={input.childName} onChangeText={text => setInput({ ...input, childName: text })} />

                    <SexPickerContainer>
                        <SexPickerItem onPress={() => setInput({ ...input, childSex: "female" })} >
                            <SexPickerItemImage source={require("../../../assets/icons/female.png")} active={input.childSex === "female" ? true : false} />
                            <Text>Feminino</Text>
                        </SexPickerItem>
                        <SexPickerItem onPress={() => setInput({ ...input, childSex: "male" })}>
                            <SexPickerItemImage source={require("../../../assets/icons/male.png")} active={input.childSex === "male" ? true : false} />
                            <Text>Masculino</Text>
                        </SexPickerItem>
                    </SexPickerContainer>

                    <Button icon="checkmark-circle-outline" title="Finalizar" onPress={() => signIn()} />
                </ChildsModalContainer>
            </Modal>
            <AlertModal visible={modal.alertModalVisible} title="Ops!" text={modal.alertMessage} type="warning" icon="warning-outline" closeAction={() => setModal({ ...modal, alertModalVisible: false })} />
        </Container>
    )
}