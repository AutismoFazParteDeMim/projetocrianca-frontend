import React from "react"
import { TouchableOpacity } from "react-native"

import styles from "./styles"
import { Icon } from "../../../styles"

function BackButton(props) {
    return (
        <TouchableOpacity onPress={props.onPress} style={styles.container}>
            <Icon name="arrow-back-outline" style={styles.icon}/>
        </TouchableOpacity>
    )
}

export default BackButton