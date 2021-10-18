import React from "react"
import { Text, TextInput, View } from "react-native"
import { colors, Icon } from "../../styles"
import styles from "./styles"

function Input(props) {
    return (
        <View style={styles.container}>
            <View style={styles.wrapper}>
                {props.icon &&
                    <View style={styles.iconWrapper}>
                        <Icon name={props.icon} style={[styles.globalIcon, styles.icon]} />
                    </View>
                }

                {props.type == "password"
                    ? <TextInput placeholder={props.placeholder} secureTextEntry={true} placeholderTextColor={colors.text} style={styles.input} />
                    : <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} />
                }

            </View>
        </View>
    )
}

export default Input