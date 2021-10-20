import React from "react"
import { Text, View, SafeAreaView, ScrollView } from "react-native"

import styles from "./styles"

import Button from "../../components/Button"

function Activity({ navigation }) {
    return (
        <View style={styles.container}>
            <Header title="Atividade" navigation={navigation} />

            <View style={styles.bottomSide}>
                <Button title="Alfabeto Pontilhado" onPress={()=> navigation.navigate('Alfabeto')}/>
                <Button type="secondary" title="Rotina" onPress={()=> navigation.navigate('Rotina')}/>
                <Button type="tertiary" title="Expressão" onPress={()=> navigation.navigate('Expressao')}/>
            </View>

        </View>
    )
}

export default Activity