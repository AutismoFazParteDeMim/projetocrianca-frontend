import React, {useContext} from "react"
import { TouchableOpacity, View } from "react-native"

import styles from "./styles"
import { Icon } from "../../../styles"

import { ThemeContext } from "../../../styles/ThemeProvider"

function CloseButton(props) {
    const { colors } = useContext(ThemeContext)

    if (props.static) {
        return (
            <View style={styles(colors).container}>
                <Icon name={props.icon} style={styles(colors).icon} />
            </View>
        )
    } else {
        return (
            <TouchableOpacity onPress={props.onPress} style={styles(colors).container}>
                <Icon name={props.icon} style={styles(colors).icon} />
            </TouchableOpacity>
        )
    }
}

export default CloseButton