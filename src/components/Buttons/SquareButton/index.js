import React from "react"
import { Container, Image, Title } from "./styles"

export default function SquareButton({...props}) {
    return (
        <Container {...props}>
            <Image source={props.image} />
            <Title>{props.title}</Title>
        </Container>
    )
}