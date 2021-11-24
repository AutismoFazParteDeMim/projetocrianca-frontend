import React, {useContext} from "react"
import { Text, TouchableOpacity, Image } from "react-native"

import styles from "./styles"

import { ThemeContext } from "../../../styles/ThemeProvider"


function SquareButton(props) {
    const { colors } = useContext(ThemeContext)
    return (
        <TouchableOpacity onPress={props.onPress} style={[props.type == "secondary" ? [styles(colors).container, styles(colors).secondaryContainer] : styles(colors).container]}>
            <Image style={styles(colors).image} source={props.image} />
            <Text style={props.type == "secondary" ? [styles(colors).title, styles(colors).secondaryTitle] : [styles(colors).title]}>{props.title}</Text>
        </TouchableOpacity>
    )
}

export default SquareButton