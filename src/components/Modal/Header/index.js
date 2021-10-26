import React from "react"
import { Text, View } from "react-native"

import styles from "./styles"
import CloseButton from "../../Button/CloseButton"

function ModalHeader(props) {
    return (
        <View style={styles.container}>
            <Text style={[styles.globalTitle, styles.title, props.color &&  {color:props.color} ]}>{props.title}</Text>
            <View style={styles.button}>
                <CloseButton onPress={props.closeAction} />
            </View>
        </View>
    )
}

export default ModalHeader