import React from "react"
import { Container, ContainerStatic, Icon } from "./styles"

export default function CircleButton({ ...props }) {
    if (props.static) {
        return (
            <ContainerStatic {...props}>
                <Icon name={props.icon} />
            </ContainerStatic>
        )
    } else {
        return (
            <Container {...props}>
                <Icon name={props.icon} />
            </Container>
        )
    }
}