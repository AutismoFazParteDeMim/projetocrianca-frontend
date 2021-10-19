import React from "react"
import { Text, SafeAreaView, View, Image } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"

function Register({ navigation }) {
    return (
        <View edges={['bottom', 'left', 'right']} style={[styles.globalContainer]}>
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={[styles.container]}>
                <Image source={require('../../../assets/animais.png')} style={styles.image} />

                <InputText type="name" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" autoCapitalize="words" />
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Crie uma senha" />
                <Button icon="arrow-forward-outline" iconPosition="right" title="Próximo" />
            </View>
        </View>
    )
}

export default Register