import React from "react"
import { Text, View, SafeAreaView, ScrollView } from "react-native"

import styles from "./styles"

import Button from "../../components/Button"

function Atividade({ navigation }) {
    return (
        <View style={styles.container}>
            <Header title="Atividade" navigation={navigation} />

            <View style={styles.bottomSide}>
                <Button title="Alfabeto Pontilhado" onPress={()=> navigation('Alfabeto')}/>
                <Button type="secondary" title="Rotina" onPress={()=> navigation('Rotina')}/>
                <Button type="tertiary" title="Expressão" onPress={()=> navigation('Expressao')}/>
            </View>

        </View>
    )
}

export default Atividade