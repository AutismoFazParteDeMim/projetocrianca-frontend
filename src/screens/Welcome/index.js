import React from "react"
import { Text, View, SafeAreaView } from "react-native"

import styles from "./styles"

import Button from "../../components/Button"
import Link from "../../components/Link"

function Welcome({ navigation }) {
    return (
        <SafeAreaView style={styles.container}>
            <View style={styles.topSide}>
                <Text style={[styles.globalTitle, styles.text, styles.title]}>Seja Bem Vindo(a)!</Text>
                <Text style={[styles.globalText, styles.text]}>Lorem ipsum nunc primiskj suscipit dictumst, sociosqu vehicula morbi fermentumf litora, facilisis tristiquedwgj  consectetur cubilia.</Text>
            </View>
            <View style={styles.bottomSide}>
                <Button title="Faça login" onPress={() => navigation.navigate('Login')} />
                <Button type="secondary" title="Crie uma conta" onPress={() => navigation.navigate('Register')} />
                <Link text="Política de privacidade" />
            </View>
        </SafeAreaView>
    )
}

export default Welcome