import React, { useContext } from "react"
import { Text, TouchableOpacity } from "react-native"

import styles from "./styles"

import { ThemeContext } from "../../styles/ThemeProvider"

function Link(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <TouchableOpacity onPress={props.onPress}>
            <Text style={styles(colors).text}>{props.text}</Text>
        </TouchableOpacity>
    )
}

export default Link