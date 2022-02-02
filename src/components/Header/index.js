import React from "react"
import { Container, Title, BackButton, Content } from "./styles"
import CircleButton from "../Buttons/CircleButton"
import { View } from "react-native"

export default function Header(props) {
    return (
        <Container>
            <Content>
                <BackButton>
                    <CircleButton icon="chevron-back" onPress={() => props.navigation.goBack()} />
                </BackButton>
                <Title>{props.title}</Title>
            </Content>
        </Container>
    )
}