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

export default function Register() {
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
                        childPic: '<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" fill="none"><metadata><rdf:RDF><cc:Work><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title>Personas by Draftbit</dc:title><dc:creator><cc:Agent><dc:title>Draftbit - draftbit.com</dc:title></cc:Agent></dc:creator><dc:source>https://personas.draftbit.com/</dc:source><cc:license rdf:resource="https://creativecommons.org/licenses/by/4.0/"/></cc:Work><cc:License rdf:about="https://creativecommons.org/licenses/by/4.0/"><cc:permits rdf:resource="https://creativecommons.org/ns#Reproduction"/><cc:permits rdf:resource="https://creativecommons.org/ns#Distribution"/><cc:permits rdf:resource="https://creativecommons.org/ns#DerivativeWorks"/><cc:requires rdf:resource="https://creativecommons.org/ns#Notice"/><cc:requires rdf:resource="https://creativecommons.org/ns#Attribution"/></cc:License></rdf:RDF></metadata><mask id="avatarsRadiusMask"><rect width="64" height="64" rx="0" ry="0" x="0" y="0" fill="#fff"/></mask><g mask="url(#avatarsRadiusMask)"><path d="M37 46.08V52a5 5 0 0 1-10 0v-5.92A14.035 14.035 0 0 1 18.58 37h-.08a4.5 4.5 0 0 1-.5-8.973V27c0-7.732 6.268-14 14-14s14 6.268 14 14v1.027A4.5 4.5 0 0 1 45.42 37 14.035 14.035 0 0 1 37 46.081Z" fill="rgba(215, 135, 116, 1)"/><mask id="personas-a" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="13" width="36" height="44"><path d="M37 46.08V52a5 5 0 0 1-10 0v-5.92A14.035 14.035 0 0 1 18.58 37h-.08a4.5 4.5 0 0 1-.5-8.973V27c0-7.732 6.268-14 14-14s14 6.268 14 14v1.027A4.5 4.5 0 0 1 45.42 37 14.035 14.035 0 0 1 37 46.081Z" fill="#fff"/></mask><g mask="url(#personas-a)"><path d="M32 13c7.732 0 14 6.268 14 14v6c0 7.732-6.268 14-14 14s-14-6.268-14-14v-6c0-7.732 6.268-14 14-14Z" fill="#fff" style="mix-blend-mode:overlay" opacity=".364"/></g><g transform="translate(20 24)"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 4.5a1.5 1.5 0 1 0 3 0 1.5 1.5 0 0 0-3 0Zm13 0a1.5 1.5 0 1 0 3 0 1.5 1.5 0 0 0-3 0Z" fill="#1B0640"/></g><g transform="translate(2 2)"><path opacity=".203" d="M30 17.002c3.881 0 7.548-.376 11 4.218l-1.9 6.492c-.611 1.228-1.636 1.559-2.463.796-2.09-1.929-4.302-2.893-6.637-2.893s-4.547.964-6.637 2.893c-.827.763-1.851.432-2.462-.796L19 21.22c3.452-4.594 7.119-4.218 11-4.218Z" fill="#000"/><path d="M27.292 11.207a3 3 0 0 1 5.416 0c6.1.957 10.809 5.235 11.292 12.71a27.697 27.697 0 0 0-3.96-1.302l-.94.602a2 2 0 0 1-2.463.462C34.547 22.559 32.335 22 30 22s-4.547.56-6.637 1.679a2 2 0 0 1-2.462-.462l-.94-.602A27.697 27.697 0 0 0 16 23.918c.483-7.476 5.192-11.754 11.292-12.711Z" fill="#F29C65"/><path d="M19.96 22.615A27.697 27.697 0 0 0 16 23.918C16.553 15.367 22.632 11 30 11s13.447 4.368 14 12.918a27.697 27.697 0 0 0-3.96-1.303L41 22c-3.452-2.667-7.119-4-11-4-3.881 0-7.548 1.333-11 4l.96.615Z" fill="#000" style="mix-blend-mode:overlay" opacity=".279"/><path d="m39.448 22.994-.349.223a2 2 0 0 1-2.462.462C34.547 22.559 32.335 22 30 22s-4.547.56-6.637 1.679a2 2 0 0 1-2.462-.462l-.349-.223c.866.068 2.183-.479 2.811-.815 2.09-1.12 4.302-1.679 6.637-1.679s4.547.56 6.637 1.679c.628.336 1.945.883 2.811.815Z" fill="#fff" style="mix-blend-mode:lighten" opacity=".203"/></g><g transform="translate(11 44)"><path d="M16 5v3a5 5 0 0 0 10 0V5l6.647 2.045A9 9 0 0 1 39 15.647V20H3v-4.353a9 9 0 0 1 6.353-8.602L16 5Z" fill="rgba(69, 109, 255, 1)"/><mask id="bodyCheckered-a" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="3" y="5" width="36" height="15"><path d="M16 5v3a5 5 0 0 0 10 0V5l6.647 2.045A9 9 0 0 1 39 15.647V20H3v-4.353a9 9 0 0 1 6.353-8.602L16 5Z" fill="#fff"/></mask><g mask="url(#bodyCheckered-a)"><path fill-rule="evenodd" clip-rule="evenodd" d="M7 20h4V6.538l-1.647.507A8.99 8.99 0 0 0 7 8.163V20ZM32.647 7.045 31 6.538V20h4V8.163a8.99 8.99 0 0 0-2.353-1.118ZM23 20h4v-8.392a7.017 7.017 0 0 1-4 3.102V20Zm-4 0h-4v-8.392a7.017 7.017 0 0 0 4 3.102V20Z" fill="#000" style="mix-blend-mode:overlay" opacity=".404"/></g><g style="mix-blend-mode:lighten" opacity=".18" fill="#fff"><path d="M3.397 13a9.014 9.014 0 0 1 2.535-4h8.139a6.982 6.982 0 0 0 2.03 4H3.397ZM39 17v3H3v-3h36ZM36.068 9a9.014 9.014 0 0 1 2.535 4H25.899a6.982 6.982 0 0 0 2.03-4h8.14Z"/></g><mask id="bodyCheckered-b" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="3" y="9" width="36" height="11"><g style="mix-blend-mode:lighten" fill="#fff"><path d="M3.397 13a9.014 9.014 0 0 1 2.535-4h8.139a6.982 6.982 0 0 0 2.03 4H3.397ZM39 17v3H3v-3h36ZM36.068 9a9.014 9.014 0 0 1 2.535 4H25.899a6.982 6.982 0 0 0 2.03-4h8.14Z"/></g></mask></g><g transform="translate(23 36)"><path d="M7.318 5.728a.75.75 0 0 1 .364-1.456c2.433.609 4.165.32 5.288-.802a.75.75 0 1 1 1.06 1.06c-1.544 1.545-3.812 1.923-6.712 1.198Z" fill="#1B0640"/></g><g><g transform="translate(24 28)"><path d="M4.25 5a.75.75 0 0 1 1.5 0c0 .836.914 1.75 2.25 1.75 1.336 0 2.25-.914 2.25-1.75a.75.75 0 0 1 1.5 0c0 1.664-1.586 3.25-3.75 3.25-2.164 0-3.75-1.586-3.75-3.25Z" fill="#000" style="mix-blend-mode:overlay" opacity=".36"/></g></g><g><g transform="translate(14 26)"><path d="M18.017 12.05a2.718 2.718 0 0 1-3.183 1.587l-5.082-1.3a1 1 0 0 1-.075-1.916l5.235-1.786a2.504 2.504 0 0 1 3.104 1.37 2.504 2.504 0 0 1 3.105-1.37l5.235 1.786a1 1 0 0 1-.075 1.915l-5.082 1.3a2.718 2.718 0 0 1-3.183-1.587Z" fill="rgba(225, 92, 102, 1)"/></g></g></g></svg>',
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

                    <Button icon="checkmark-circle-outline" title="Concluído" onPress={() => signIn()} />
                </ChildsModalContainer>
            </Modal>
            <AlertModal visible={alertModalVisible} title="Ops!" text={errorMessage} type="warning" icon="warning-outline" closeAction={() => setAlertModalVisible(false)} />
        </Container>
    )
}