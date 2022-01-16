import React from "react"
import { Container, Image, Title } from "./styles"

export default function SquareButton(props) {
    return (
        <Container onPress={props.onPress}>
            <Image source={props.image} />
            <Title>{props.title}</Title>
        </Container>
    )
}