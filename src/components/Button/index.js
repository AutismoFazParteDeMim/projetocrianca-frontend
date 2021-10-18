import React from "react"
import { Text, TouchableOpacity } from "react-native"
import { Icon } from "../../styles"

import styles from "./styles"

function Button(props) {
    return (
        <TouchableOpacity onPress={props.onPress} style={[props.iconPosition == "right" ? { flexDirection: "row-reverse" } : { flexDirection: "row" }, props.type == "secondary" ? [styles.container, styles.secondaryContainer] : styles.container]}>
            <Icon name={props.icon} style={props.type == "secondary" ? [styles.icon, styles.secondaryIcon] : styles.icon} />
            <Text style={props.type == "secondary" ? [styles.title, styles.secondaryTitle] : styles.title}>{props.title}</Text>
        </TouchableOpacity>
    )
}

export default Button