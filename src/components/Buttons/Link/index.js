import React from "react"
import { TouchableOpacity } from "react-native"
import { LinkText } from "./style"

export default function Link(props) {
    return (
        <TouchableOpacity onPress={props.onPress}>
            <LinkText>{props.title}</LinkText>
        </TouchableOpacity>
    )
}