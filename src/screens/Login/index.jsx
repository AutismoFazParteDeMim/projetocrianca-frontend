import { useState, useEffect } from "react"
import { Platform, View } from "react-native"
import { GoogleSignin } from '@react-native-google-signin/google-signin'
import { Modal, AlertModal, Text, Link, Button, TextInput } from "../../components"
import { Settings, LoginManager, AccessToken } from "react-native-fbsdk-next"
import { auth } from "../../config/firebase"
import { sendPasswordResetEmail, signInWithEmailAndPassword, signInWithCredential, GoogleAuthProvider, FacebookAuthProvider } from "firebase/auth"

import { Container, ForgotPassModalContainer, ForgotPassButtonContaier, Form, Image, GoogleButton, FacebookButton } from "./styles"

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
                await signInWithEmailAndPassword(auth, input.email, input.password)
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

    async function signInWithGoogle() {
        try {
            GoogleSignin.hasPlayServices({ showPlayServicesUpdateDialog: true }).then(async () => {
                const { idToken } = await GoogleSignin.signIn()
                await signInWithCredential(auth, GoogleAuthProvider.credential(idToken))
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
                        await signInWithCredential(auth, FacebookAuthProvider.credential(res.accessToken.toString()))
                    })
                }
            })
        } catch (error) {
            console.log(error)
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

    return (
        <>
            <Container behavior={Platform.OS === "ios" ? "padding" : "position"} keyboardVerticalOffset={-160}>
                <View style={{ width: "100%" }}>
                    <GoogleButton title="Login com o Google" icon="logo-google" onPress={() => signInWithGoogle()} />
                    <FacebookButton title="Login com o Facebook" icon="logo-facebook" onPress={() => signInWithFacebook()} />
                </View>

                <Text style={{ marginBottom: 16, marginTop: 16 }}>OU</Text>

                <Form>
                    <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="next" value={input.email} onChangeText={text => setInput({ ...input, email: text })} />
                    <TextInput type="password" icon="lock-closed-outline" placeholder="Insira sua senha" returnKeyType="done" value={input.password} onChangeText={text => setInput({ ...input, password: text })} />
                    <ForgotPassButtonContaier>
                        <Link title="Esqueceu sua senha?" onPress={() => setModal({ ...modal, modalVisible: true })} />
                    </ForgotPassButtonContaier>

                    <Button icon="log-in-outline" title="Entrar" onPress={() => logIn()} />
                </Form>
            </Container>
            <Modal visible={modal.modalVisible} title="Redefinir Senha" size="default" closeAction={() => setModal({ ...modal, modalVisible: false })}>
                <ForgotPassModalContainer>
                    <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                    <TextInput type="email" icon="mail-outline" placeholder="Insira seu email" returnKeyType="done" value={input.email} onChangeText={text => setInput({ ...input, email: text })} />
                    <Button icon="send" title="Enviar email" onPress={() => resetPass()} inverted />
                </ForgotPassModalContainer>
            </Modal>
            <AlertModal visible={modal.alertWarningVisible} title="Ops!" text={modal.alertMessage} type="warning" icon="warning-outline" closeAction={() => setModal({ ...modal, alertWarningVisible: false })} />
            <AlertModal visible={modal.alertSuccessVisible} title="Sucesso!" text={modal.alertMessage} type="success" icon="checkmark-circle-outline" closeAction={() => setModal({ ...modal, alertSuccessVisible: false, modalVisible: false })} />
        </>
    )
}