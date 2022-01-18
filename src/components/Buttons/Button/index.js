import React from "react"
import { ButtonIcon, ButtonTitle, Container } from "./style"

export default function Button(props) {
    return (
        <Container type={props.type} inverted={props.inverted}>
            <ButtonIcon name={props.icon} textColor={props.textColor} />
            <ButtonTitle textColor={props.textColor}>{props.title}</ButtonTitle>
        </Container>
    )
}