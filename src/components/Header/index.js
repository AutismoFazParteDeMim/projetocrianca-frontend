import React from "react";

import { View, Text } from "react-native"

import Button from '../Button'

import style from "./style"

function Header(props) {
    return (
        <View style={style.container}>
            <View style={style.button}>
                <Button type="back" />
            </View>
            <Text style={[style.text, style.title]}>{props.title}</Text>
        </View>
    )
}

export default Header