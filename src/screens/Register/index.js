import React from "react"
import { Text, SafeAreaView, View, Image } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import Input from "../../components/Input"
import Button from "../../components/Button"

function Register({ navigation }) {
    return (
        <SafeAreaView style={[styles.globalContainer]}>
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={[styles.container]}>
                <Image source={require('../../../assets/animais.png')} style={styles.image} />

                <Input type="text" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" />
                <Input type="text" icon="mail-outline" placeholder="Insira seu e-mail" />
                <Input type="password" icon="lock-closed-outline" placeholder="Crie uma senha" />
                <Button type="primary" icon="arrow-forward-outline" iconPosition="right" title="Próximo" />
            </View>
        </SafeAreaView>
    )
}

export default Register