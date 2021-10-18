import React from "react"
import { Text, TextInput, View } from "react-native"
import { colors, Icon } from "../../../styles"
import styles from "../styles"

function Input(props) {
    return (
        <View style={styles.container}>
            <View style={styles.wrapper}>
                {props.icon &&
                    <View style={styles.iconWrapper}>
                        <Icon name={props.icon} style={[styles.globalIcon, styles.icon]} />
                    </View>
                }
                <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} secureTextEntry={true} autoCompleteType={props.type} autoCorrect={false}/>
            </View>
        </View>
    )
}

export default Input