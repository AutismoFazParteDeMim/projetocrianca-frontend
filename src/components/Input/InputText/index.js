import React, { useContext } from "react"
import { Text, TextInput, View } from "react-native"
import { Icon } from "../../../styles"
import styles from "../styles"

import { ThemeContext } from "../../../styles/ThemeProvider"

function Input(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <View style={[styles(colors).container, props.style]}>
            <View style={styles(colors).wrapper}>
                {props.icon &&
                    <View style={styles(colors).iconWrapper}>
                        <Icon name={props.icon} style={[styles(colors).icon]} />
                    </View>
                }

                {props.type == "email"
                    ? <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text_alt_dark} style={styles(colors).input} autoCompleteType={props.type} autoCorrect={false} autoCapitalize="none" onChangeText={props.onChangeText} />
                    : props.autoCapitalize
                        ? <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text_alt_dark} style={styles(colors).input} autoCompleteType={props.type} autoCapitalize={props.autoCapitalize} onChangeText={props.onChangeText} />
                        : <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text_alt_dark} style={styles(colors).input} autoCompleteType={props.type} onChangeText={props.onChangeText} />
                }
            </View>
        </View>
    )
}

export default Input