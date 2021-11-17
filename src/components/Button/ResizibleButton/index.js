import React from "react"
import { Text, TouchableOpacity, Image, View } from "react-native"

import styles from "./styles"

function ResizibleButton(props){
    let caminho = '../../../../assets/'+props.imagem
    return(
        
        <TouchableOpacity onPress={props.onPress} style={[props.iconPosition == "right" ? { flexDirection: "row-reverse" } : { flexDirection: "row" }, props.type == "rebutton" ? [styles.container, styles.Container] : styles.container]}>
            <Image source={require(caminho)} style={styles.imagem}/>
            <Text style={[styles.title, styles.Title]}>props.title+"\n"</Text>
            <Text style={[styles.subtitle, styles.Title]}>props.subtitle+"\n"</Text>
        </TouchableOpacity>
    )
}

export default ResizibleButton