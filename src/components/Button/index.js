import React from "react"
import { Text, TouchableOpacity } from "react-native"

import styles from "./styles"

function Button(props) {
    if (props.type == "secondary") {
        return (
            <TouchableOpacity onPress={props.onPress} style={[styles.container, styles.secondaryContainer]}>
                <Text style={[styles.title, styles.secondaryTitle]}>{props.title}</Text>
            </TouchableOpacity>
        )
    } else {
        return (
            <TouchableOpacity onPress={props.onPress} style={styles.container}>
                <Text style={styles.title}>{props.title}</Text>
            </TouchableOpacity>
        )
    }
}

export default Button