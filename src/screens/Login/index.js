import React from "react"
import { Text, View, Image } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import Link from "../../components/Link"
import CustomModal from "../../components/Modal/CustomModal"

function Login({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)
    return (
        <View style={styles.globalContainer}>
            <Header title="Login" navigation={navigation} />

            <View style={[styles.container]}>
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Insira sua senha" />
                <View style={styles.link} >
                    <Link text="Esqueceu sua senha?" onPress={() => setShowModal(true)} />
                </View>
                <Button icon="enter-outline" iconPosition="left" title="Entrar" />
                <Image source={require('../../../assets/animais.png')} style={styles.animals} />
            </View>

            <CustomModal visible={showModal} title="Redefinição de senha" closeAction={() => setShowModal(false)}>
                <Text>Enviaremos um e-mail com todas as instruções para a redefinição de senha.</Text>
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <Button icon="send-outline" iconPosition="right" title="Enviar" onPress={() => setShowModal(false)} />
            </CustomModal>
        </View>
    )
}

export default Login