import React from "react"
import { Container, Icon } from "./styles"

export default function CircleButton(props) {
    return (
        <Container onPress={props.onPress}>
            <Icon name={props.icon} />
        </Container>
    )
}