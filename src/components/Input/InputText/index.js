import React from "react"
import { Text, TextInput, View } from "react-native"
import { colors, Icon } from "../../../styles"
import styles from "../styles"

function Input(props) {
    return (
        <View style={[styles.container, props.style]}>
            <View style={styles.wrapper}>
                {props.icon &&
                    <View style={styles.iconWrapper}>
                        <Icon name={props.icon} style={[styles.icon]} />
                    </View>
                }

                {props.type == "email"
                    ? <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} autoCompleteType={props.type} autoCorrect={false} autoCapitalize="none" onChangeText={props.onChangeText} />
                    : props.autoCapitalize
                        ? <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} autoCompleteType={props.type} autoCapitalize={props.autoCapitalize} onChangeText={props.onChangeText} />
                        : <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} autoCompleteType={props.type} onChangeText={props.onChangeText} />
                }
            </View>
        </View>
    )
}

export default Input