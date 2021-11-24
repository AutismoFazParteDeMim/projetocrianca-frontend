import React, {useContext} from "react"
import { Text, TouchableOpacity, Image, View } from "react-native"

import styles from "./styles"

import { ThemeContext } from "../../../styles/ThemeProvider"

function ResizibleButton(props) {
    const { colors } = useContext(ThemeContext)

    let caminho = '../../../../assets/' + props.imagem
    return (

        <TouchableOpacity onPress={props.onPress} style={[props.iconPosition == "right" ? { flexDirection: "row-reverse" } : { flexDirection: "row" }, props.type == "rebutton" ? [styles(colors).container, styles(colors).Container] : styles(colors).container]}>
            <Image source={require(caminho)} style={styles(colors).imagem} />
            <Text style={[styles(colors).title, styles(colors).Title]}>props.title+"\n"</Text>
            <Text style={[styles(colors).subtitle, styles(colors).Title]}>props.subtitle+"\n"</Text>
        </TouchableOpacity>
    )
}

export default ResizibleButton