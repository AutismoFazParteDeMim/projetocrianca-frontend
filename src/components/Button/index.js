import React, { useContext } from "react"
import { Text, TouchableOpacity } from "react-native"
import { Icon } from "../../styles"

import styles from "./styles"
import { ThemeContext } from "../../styles/ThemeProvider"

function Button(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <TouchableOpacity onPress={props.onPress} style={[props.iconPosition == "right" ? { flexDirection: "row-reverse" } : { flexDirection: "row" }, props.type == "secondary" ? [styles(colors).container, styles(colors).secondaryContainer] : styles(colors).container]}>
            <Icon name={props.icon} style={props.type == "secondary" ? [styles(colors).icon, styles(colors).secondaryIcon] : styles(colors).icon} />
            <Text style={props.type == "secondary" ? [styles(colors).title, styles(colors).secondaryTitle] : [styles(colors).title]}>{props.title}</Text>
        </TouchableOpacity>
    )
}

export default Button