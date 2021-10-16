import React from "react"
import { Text, SafeAreaView } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"

function Register({navigation}) {
    return (
        <SafeAreaView style={[styles.globalContainer]}>
            <Header title="Cadastre-se" navigation={navigation} />
            <Text>Registro</Text>
        </SafeAreaView>
    )
}

export default Register