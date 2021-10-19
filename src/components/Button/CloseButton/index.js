import React from "react"
import { TouchableOpacity } from "react-native"

import styles from "./styles"
import { Icon } from "../../../styles"

function CloseButton(props){
    return(
        <TouchableOpacity onPress={props.onPress} style={styles.container}>
            <Icon name="close" style={styles.icon}/>
        </TouchableOpacity>
    )
}

export default CloseButton