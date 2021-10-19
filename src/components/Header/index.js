import React from "react"
import { Text, View } from "react-native"

import styles from "./styles"
import BackButton from "./BackButton"

function Header(props) {
    return (
        <View style={styles.container}>
            <View style={styles.button}>
                <BackButton onPress={() => props.navigation.goBack()} />
            </View>
            <Text style={styles.globalTitle}>{props.title}</Text>
        </View>
    )
}

export default Header