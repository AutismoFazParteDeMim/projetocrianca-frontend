import React, { useContext } from "react"
import { Text, View } from "react-native"

import styles from "./styles"
import CloseButton from "../../Button/CloseButton"
import { ThemeContext } from "../../../styles/ThemeProvider"

function ModalHeader(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <View style={styles(colors).container}>
            <Text style={[styles(colors).globalTitle, styles(colors).title, props.color && { color: props.color }]}>{props.title}</Text>
            <View style={styles(colors).button}>
                <CloseButton icon="close" onPress={props.closeAction} />
            </View>
        </View>
    )
}

export default ModalHeader