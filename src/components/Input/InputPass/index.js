import React, { useContext } from "react"
import { Text, TextInput, View } from "react-native"
import { colors, Icon } from "../../../styles"
import styles from "../styles"

import { ThemeContext } from "../../../styles/ThemeProvider"

function Input(props, { ...rest }) {
    const { colors } = useContext(ThemeContext)
    return (
        <View style={[styles(colors).container, props.style]}>
            <View style={styles(colors).wrapper}>
                {props.icon &&
                    <View style={styles(colors).iconWrapper}>
                        <Icon name={props.icon} style={[styles(colors).icon]} />
                    </View>
                }
                <TextInput {...rest} placeholder={props.placeholder} placeholderTextColor={colors.text_alt_dark} style={styles(colors).input} secureTextEntry={true} autoCompleteType={props.type} autoCorrect={false} onChangeText={props.onChangeText} />
            </View>
        </View>
    )
}

export default Input