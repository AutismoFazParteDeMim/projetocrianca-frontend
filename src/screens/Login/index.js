import React from "react"
import { SafeAreaView, View, Image } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"

function Login({ navigation }) {
    return (
        <View edges={['bottom', 'left', 'right']} style={styles.globalContainer}>
            <Header title="Login" navigation={navigation} />

            <View style={[styles.container]}>

                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Insira sua senha" />
                <Button icon="enter-outline" iconPosition="left" title="Entrar" />
                <Image source={require('../../../assets/animais.png')} style={styles.animals} />

            </View>
        </View>
    )
}

export default Login