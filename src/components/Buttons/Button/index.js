import React from "react"
import { ButtonIcon, ButtonTitle, Container } from "./style"

export default function Button(props) {
    return (
        <Container {...props}>
            <ButtonIcon name={props.icon} type={props.type} textColor={props.textColor} />
            <ButtonTitle type={props.type} textColor={props.textColor}>{props.title}</ButtonTitle>
        </Container>
    )
}