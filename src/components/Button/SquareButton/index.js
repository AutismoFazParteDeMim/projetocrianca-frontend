import React from "react"
import { Text, TouchableOpacity, Image } from "react-native"

import styles from "./styles"

function SquareButton(props) {
    return (
        <TouchableOpacity onPress={props.onPress} style={[ props.type == "secondary" ? [styles.container, styles.secondaryContainer] : styles.container]}>
            <Image style={styles.image} source={props.image}/>
            <Text style={props.type == "secondary" ? [styles.title, styles.secondaryTitle] : [styles.title]}>{props.title}</Text>
        </TouchableOpacity>
    )
}

export default SquareButton