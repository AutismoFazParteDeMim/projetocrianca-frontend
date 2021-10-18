import React from "react"
import { Text, TouchableOpacity } from "react-native"
import { Icon } from "../../styles"

import styles from "./styles"

function Button(props) {
    return (
        <TouchableOpacity onPress={props.onPress} style={props.type == "secondary" ? [styles.container, styles.secondaryContainer] : styles.container}>
            {props.iconPosition == "left" && <Icon name={props.icon} style={props.type == "secondary" ? [styles.icon, styles.secondaryIcon] : styles.icon} />}
            <Text style={props.type == "secondary" ? [styles.title, styles.secondaryTitle] : styles.title}>{props.title}</Text>
            {props.iconPosition == "right" && <Icon name={props.icon} style={props.type == "secondary" ? [styles.icon, styles.secondaryIcon] : styles.icon} />}
        </TouchableOpacity>
    )
}

export default Button