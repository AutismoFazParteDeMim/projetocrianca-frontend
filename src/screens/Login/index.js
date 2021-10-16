import React from "react"
import { Text, SafeAreaView } from "react-native"

import Header from "../../components/Header"

function Login({navigation}) {
    return (
        <SafeAreaView>
            <Header title="Login" navigation={navigation} />
            <Text>Login</Text>
        </SafeAreaView>
    )
}

export default Login