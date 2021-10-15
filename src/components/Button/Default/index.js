import React from "react";

import { Text, TouchableOpacity } from "react-native";
import Icon from "@expo/vector-icons/Ionicons"

import style from "./style"


function Default(props) {
    if (props.type == "primary") {
        if (props.icon) {
            return (
                <TouchableOpacity style={[style.container, style.containerPrimary]}>
                    <Icon name={props.icon} style={[style.icon, style.iconPrimary]} />
                    <Text style={[style.text, style.textPrimary]}>{props.text}</Text>
                </TouchableOpacity>
            )
        } else {
            return (
                <TouchableOpacity style={[style.container, style.containerPrimary]}>
                    <Text style={[style.text, style.textPrimary]}>{props.text}</Text>
                </TouchableOpacity>
            )
        }
    } else {
        if (props.icon) {
            return (
                <TouchableOpacity style={style.container}>
                    <Icon name={props.icon} style={style.icon} />
                    <Text style={style.text}>{props.text}</Text>
                </TouchableOpacity>
            )
        } else {
            return (
                <TouchableOpacity style={style.container}>
                    <Text style={style.text}>{props.text}</Text>
                </TouchableOpacity>
            )
        }
    }
}

export default Default