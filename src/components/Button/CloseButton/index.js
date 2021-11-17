import React from "react"
import { TouchableOpacity, View } from "react-native"

import styles from "./styles"
import { Icon } from "../../../styles"

function CloseButton(props) {
    if (props.static) {
        return (
            <View style={styles.container}>
                <Icon name={props.icon} style={styles.icon} />
            </View>
        )
    } else {
        return (
            <TouchableOpacity onPress={props.onPress} style={styles.container}>
                <Icon name={props.icon} style={styles.icon} />
            </TouchableOpacity>
        )
    }
}

export default CloseButton