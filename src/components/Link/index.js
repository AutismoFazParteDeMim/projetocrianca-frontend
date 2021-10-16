import React from "react"
import { Text, TouchableOpacity } from "react-native"

import styles from "./styles"

function Link(props) {
    return (
        <TouchableOpacity onPress={props.onPress}>
            <Text style={styles.text}>{props.text}</Text>
        </TouchableOpacity>
    )
}

export default Link