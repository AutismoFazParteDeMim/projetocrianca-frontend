import React, {useContext} from "react"
import { TouchableOpacity } from "react-native"

import styles from "./styles"
import { Icon } from "../../../styles"
import { ThemeContext } from "../../../styles/ThemeProvider"

function BackButton(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <TouchableOpacity onPress={props.onPress} style={styles(colors).container}>
            <Icon name="arrow-back-outline" style={styles(colors).icon} />
        </TouchableOpacity>
    )
}

export default BackButton