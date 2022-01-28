import React from "react"
import { ButtonIcon, ButtonTitle, Container } from "./style"

export default function Button(props) {
    return (
        <Container {...props}>
            <ButtonIcon name={props.icon} textColor={props.textColor} />
            <ButtonTitle textColor={props.textColor}>{props.title}</ButtonTitle>
        </Container>
    )
}