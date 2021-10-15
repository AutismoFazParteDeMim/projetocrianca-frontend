import React from "react";

import { TouchableOpacity } from "react-native";
import Icon from "@expo/vector-icons/Ionicons"

import style from "./style"


function Back() {
    return (
        <TouchableOpacity style={style.container}>
            <Icon name="arrow-back-outline" size={24} style={style.icon} />
        </TouchableOpacity>
    )
}

export default Back