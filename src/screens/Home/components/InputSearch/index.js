import React from "react"
import { Text, TextInput, View, StyleSheet } from "react-native"
import {colors, Icon} from "../../../../styles"
import styles from "../../styles"

function InputSearch(props) {
    return (
        <View style={styles.containerInputSearch}>
            <View style={styles.wrapper}>
                <View style={styles.iconWrapper}>
                    <Icon name={props.icon} style={[styles.icon]} />
                </View>

                <TextInput placeholder={props.placeholder} placeholderTextColor={colors.text} style={styles.input} autoCompleteType={props.type} autoCorrect={false} autoCapitalize="none" />
            </View>
        </View>
    )
}

export default InputSearch