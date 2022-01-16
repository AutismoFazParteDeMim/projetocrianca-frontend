import React from "react"
import { Container, Title, BackButton } from "./styles"
import CircleButton from "../Buttons/CircleButton"

export default function Header({ navigation, ...props }) {
    //let options = props.scene.descriptor.options
    return (
        <Container>
            <BackButton>
                <CircleButton icon="arrow-back-outline" onPress={() => navigation.goBack()} />
            </BackButton>
            <Title>{props.title}</Title>
        </Container>
    )
}