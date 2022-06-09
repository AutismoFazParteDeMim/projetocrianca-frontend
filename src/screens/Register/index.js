import React, { useState, useEffect } from "react"
import { Platform, View } from "react-native"

import { Settings, LoginManager, AccessToken } from "react-native-fbsdk-next"
import { firestore, auth } from "../../config/firebase"
import { createUserWithEmailAndPassword, updateProfile, sendEmailVerification, signInWithCredential, GoogleAuthProvider, FacebookAuthProvider } from "firebase/auth"
import { setDoc, doc } from "firebase/firestore"
import { Text, TextInput, Button, Modal, AlertModal } from "../../components"
import {
    GoogleSignin,
} from '@react-native-google-signin/google-signin'

import { Container, Form, ChildsModalContainer, SexPickerContainer, SexPickerItem, SexPickerItemImage, GoogleButton, FacebookButton } from "./styles"


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
        googleSignIn: false,
        facebookSignIn: false,
        alertMessage: ""
    })


    useEffect(() => {
        GoogleSignin.configure({
            scopes: ['https://www.googleapis.com/auth/drive.readonly'], // [Android] what API you want to access on behalf of the user, default is email and profile
            webClientId: '156087953461-u43kgs4n2esf37m88fq8tjkvlvoo37tc.apps.googleusercontent.com', // client ID of type WEB for your server (needed to verify user ID and offline access)
            offlineAccess: true,
            hostedDomain: ""
        })
        Settings.setAppID("1204445570094088")
        Settings.initializeSDK()
        LoginManager.setLoginBehavior("web_only")
    }, [])


    async function saveUserData(res) {
        await setDoc(doc(firestore, "users", res.user.uid), {
            childName: input.childName,
            childSex: input.childSex,
            childPic: '<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" fill="none"><metadata><rdf:RDF><cc:Work><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/><dc:title>Personas by Draftbit</dc:title><dc:creator><cc:Agent><dc:title>Draftbit - draftbit.com</dc:title></cc:Agent></dc:creator><dc:source>https://personas.draftbit.com/</dc:source><cc:license rdf:resource="https://creativecommons.org/licenses/by/4.0/"/></cc:Work><cc:License rdf:about="https://creativecommons.org/licenses/by/4.0/"><cc:permits rdf:resource="https://creativecommons.org/ns#Reproduction"/><cc:permits rdf:resource="https://creativecommons.org/ns#Distribution"/><cc:permits rdf:resource="https://creativecommons.org/ns#DerivativeWorks"/><cc:requires rdf:resource="https://creativecommons.org/ns#Notice"/><cc:requires rdf:resource="https://creativecommons.org/ns#Attribution"/></cc:License></rdf:RDF></metadata><mask id="avatarsRadiusMask"><rect width="64" height="64" rx="0" ry="0" x="0" y="0" fill="#fff"/></mask><g mask="url(#avatarsRadiusMask)"><path d="M37 46.08V52a5 5 0 0 1-10 0v-5.92A14.035 14.035 0 0 1 18.58 37h-.08a4.5 4.5 0 0 1-.5-8.973V27c0-7.732 6.268-14 14-14s14 6.268 14 14v1.027A4.5 4.5 0 0 1 45.42 37 14.035 14.035 0 0 1 37 46.081Z" fill="rgba(215, 135, 116, 1)"/><mask id="personas-a" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="14" y="13" width="36" height="44"><path d="M37 46.08V52a5 5 0 0 1-10 0v-5.92A14.035 14.035 0 0 1 18.58 37h-.08a4.5 4.5 0 0 1-.5-8.973V27c0-7.732 6.268-14 14-14s14 6.268 14 14v1.027A4.5 4.5 0 0 1 45.42 37 14.035 14.035 0 0 1 37 46.081Z" fill="#fff"/></mask><g mask="url(#personas-a)"><path d="M32 13c7.732 0 14 6.268 14 14v6c0 7.732-6.268 14-14 14s-14-6.268-14-14v-6c0-7.732 6.268-14 14-14Z" fill="#fff" style="mix-blend-mode:overlay" opacity=".364"/></g><g transform="translate(20 24)"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 4.5a1.5 1.5 0 1 0 3 0 1.5 1.5 0 0 0-3 0Zm13 0a1.5 1.5 0 1 0 3 0 1.5 1.5 0 0 0-3 0Z" fill="#1B0640"/></g><g transform="translate(2 2)"><path opacity=".203" d="M30 17.002c3.881 0 7.548-.376 11 4.218l-1.9 6.492c-.611 1.228-1.636 1.559-2.463.796-2.09-1.929-4.302-2.893-6.637-2.893s-4.547.964-6.637 2.893c-.827.763-1.851.432-2.462-.796L19 21.22c3.452-4.594 7.119-4.218 11-4.218Z" fill="#000"/><path d="M27.292 11.207a3 3 0 0 1 5.416 0c6.1.957 10.809 5.235 11.292 12.71a27.697 27.697 0 0 0-3.96-1.302l-.94.602a2 2 0 0 1-2.463.462C34.547 22.559 32.335 22 30 22s-4.547.56-6.637 1.679a2 2 0 0 1-2.462-.462l-.94-.602A27.697 27.697 0 0 0 16 23.918c.483-7.476 5.192-11.754 11.292-12.711Z" fill="#F29C65"/><path d="M19.96 22.615A27.697 27.697 0 0 0 16 23.918C16.553 15.367 22.632 11 30 11s13.447 4.368 14 12.918a27.697 27.697 0 0 0-3.96-1.303L41 22c-3.452-2.667-7.119-4-11-4-3.881 0-7.548 1.333-11 4l.96.615Z" fill="#000" style="mix-blend-mode:overlay" opacity=".279"/><path d="m39.448 22.994-.349.223a2 2 0 0 1-2.462.462C34.547 22.559 32.335 22 30 22s-4.547.56-6.637 1.679a2 2 0 0 1-2.462-.462l-.349-.223c.866.068 2.183-.479 2.811-.815 2.09-1.12 4.302-1.679 6.637-1.679s4.547.56 6.637 1.679c.628.336 1.945.883 2.811.815Z" fill="#fff" style="mix-blend-mode:lighten" opacity=".203"/></g><g transform="translate(11 44)"><path d="M16 5v3a5 5 0 0 0 10 0V5l6.647 2.045A9 9 0 0 1 39 15.647V20H3v-4.353a9 9 0 0 1 6.353-8.602L16 5Z" fill="rgba(69, 109, 255, 1)"/><mask id="bodyCheckered-a" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="3" y="5" width="36" height="15"><path d="M16 5v3a5 5 0 0 0 10 0V5l6.647 2.045A9 9 0 0 1 39 15.647V20H3v-4.353a9 9 0 0 1 6.353-8.602L16 5Z" fill="#fff"/></mask><g mask="url(#bodyCheckered-a)"><path fill-rule="evenodd" clip-rule="evenodd" d="M7 20h4V6.538l-1.647.507A8.99 8.99 0 0 0 7 8.163V20ZM32.647 7.045 31 6.538V20h4V8.163a8.99 8.99 0 0 0-2.353-1.118ZM23 20h4v-8.392a7.017 7.017 0 0 1-4 3.102V20Zm-4 0h-4v-8.392a7.017 7.017 0 0 0 4 3.102V20Z" fill="#000" style="mix-blend-mode:overlay" opacity=".404"/></g><g style="mix-blend-mode:lighten" opacity=".18" fill="#fff"><path d="M3.397 13a9.014 9.014 0 0 1 2.535-4h8.139a6.982 6.982 0 0 0 2.03 4H3.397ZM39 17v3H3v-3h36ZM36.068 9a9.014 9.014 0 0 1 2.535 4H25.899a6.982 6.982 0 0 0 2.03-4h8.14Z"/></g><mask id="bodyCheckered-b" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="3" y="9" width="36" height="11"><g style="mix-blend-mode:lighten" fill="#fff"><path d="M3.397 13a9.014 9.014 0 0 1 2.535-4h8.139a6.982 6.982 0 0 0 2.03 4H3.397ZM39 17v3H3v-3h36ZM36.068 9a9.014 9.014 0 0 1 2.535 4H25.899a6.982 6.982 0 0 0 2.03-4h8.14Z"/></g></mask></g><g transform="translate(23 36)"><path d="M7.318 5.728a.75.75 0 0 1 .364-1.456c2.433.609 4.165.32 5.288-.802a.75.75 0 1 1 1.06 1.06c-1.544 1.545-3.812 1.923-6.712 1.198Z" fill="#1B0640"/></g><g><g transform="translate(24 28)"><path d="M4.25 5a.75.75 0 0 1 1.5 0c0 .836.914 1.75 2.25 1.75 1.336 0 2.25-.914 2.25-1.75a.75.75 0 0 1 1.5 0c0 1.664-1.586 3.25-3.75 3.25-2.164 0-3.75-1.586-3.75-3.25Z" fill="#000" style="mix-blend-mode:overlay" opacity=".36"/></g></g><g><g transform="translate(14 26)"><path d="M18.017 12.05a2.718 2.718 0 0 1-3.183 1.587l-5.082-1.3a1 1 0 0 1-.075-1.916l5.235-1.786a2.504 2.504 0 0 1 3.104 1.37 2.504 2.504 0 0 1 3.105-1.37l5.235 1.786a1 1 0 0 1-.075 1.915l-5.082 1.3a2.718 2.718 0 0 1-3.183-1.587Z" fill="rgba(225, 92, 102, 1)"/></g></g></g></svg>',
        }).then(() => {
            updateProfile(res.user, { displayName: input.name })
            sendEmailVerification(res.user)
        }).catch((error) => {
            console.log(error)
        })
    }

    async function signInWithEmailAndPass() {
        if (input.name === "" || input.email === "" || input.password === "" || input.confirmPassword === "" || input.childName === "" || input.childSex === "") {
            setModal({ ...modal, alertMessage: "Nenhum campo pode estar vazio!", alertModalVisible: true })
        } else if (input.password.length < 8) {
            setModal({ ...modal, alertMessage: "A senha deve conter pelo menos 08 caracteres!", alertModalVisible: true })
        } else if (input.password != input.confirmPassword) {
            setModal({ ...modal, alertMessage: "Senhas não conferem. Verifique e tente novamente!", alertModalVisible: true })
        } else {
            try {
                await createUserWithEmailAndPassword(auth, input.email, input.password).then(async (res) => {
                    await saveUserData(res)
                })
            } catch (error) {
                setModal({ ...modal, alertMessage: error.code + ": " + error.message, alertModalVisible: true })
            }
        }
    }

    async function signInWithGoogle() {
        try {
            GoogleSignin.hasPlayServices({ showPlayServicesUpdateDialog: true }).then(async () => {
                const { idToken } = await GoogleSignin.signIn()
                await signInWithCredential(auth, GoogleAuthProvider.credential(idToken)).then(async (res) => {
                    await saveUserData(res)
                })
            })
        } catch (error) {
            console.log(error)
        }
    }

    async function signInWithFacebook() {
        try {
            await LoginManager.logInWithPermissions(["public_profile"]).then(async (res) => {
                if (res.isCancelled) {
                    console.log("Login cancelled");
                } else {
                    await AccessToken.getCurrentAccessToken().then(async (res) => {
                        await signInWithCredential(auth, FacebookAuthProvider.credential(res.accessToken.toString())).then(async (res) => {
                            await saveUserData(res)
                        })
                    }).catch(error => console.log(error))
                }
            }).catch(error => console.log(error))
        }
        catch (error) { console.log(error) }
    }

    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "position"} keyboardVerticalOffset={-160}>
            <View style={{ width: "100%" }}>
                <GoogleButton title="Cadastrar com o Google" icon="logo-google" onPress={() => setModal({ ...modal, facebookSignIn: false, googleSignIn: true, modalVisible: true })} />
                <FacebookButton title="Cadastrar com o Facebook" icon="logo-facebook" onPress={() => setModal({ ...modal, googleSignIn: false, facebookSignIn: true, modalVisible: true })} />

            </View>

            <Text style={{ marginBottom: 16, marginTop: 16 }}>OU</Text>
            
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
                            <SexPickerItemImage source={require("../../../assets/icons/AvatarF.png")} active={input.childSex === "female" ? true : false} />
                            <Text>Feminino</Text>
                        </SexPickerItem>
                        <SexPickerItem onPress={() => setInput({ ...input, childSex: "male" })}>
                            <SexPickerItemImage source={require("../../../assets/icons/AvatarM.png")} active={input.childSex === "male" ? true : false} />
                            <Text>Masculino</Text>
                        </SexPickerItem>
                    </SexPickerContainer>

                    <Button icon="checkmark-circle-outline" title="Concluído" onPress={() => modal.googleSignIn ? signInWithGoogle() : modal.facebookSignIn ? signInWithFacebook() : signInWithEmailAndPass()} />
                </ChildsModalContainer>
            </Modal>
            <AlertModal visible={modal.alertModalVisible} title="Ops!" text={modal.alertMessage} type="warning" icon="warning-outline" closeAction={() => setModal({ ...modal, alertModalVisible: false })} />
        </Container>
    )
}
