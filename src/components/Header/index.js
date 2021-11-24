import React, { useContext } from "react"
import { Text, View } from "react-native"

import styles from "./styles"
import BackButton from "./BackButton"
import { ThemeContext } from "../../styles/ThemeProvider"
function Header(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <View style={[styles(colors).container, props.transparent && { backgroundColor: "transparent" }]}>
            <View style={styles(colors).button}>
                <BackButton onPress={() => props.navigation.goBack()} />
            </View>
            <Text style={styles(colors).globalTitle}>{props.title}</Text>
        </View>
    )
}

export default Header