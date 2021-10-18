import React from "react"
import { Text, SafeAreaView, View } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"

function Login({ navigation }) {
    return (
        <SafeAreaView style={styles.globalContainer}>
            <Header title="Login" navigation={navigation} />
            
            <View>
                
            </View>
        </SafeAreaView>
    )
}

export default Login