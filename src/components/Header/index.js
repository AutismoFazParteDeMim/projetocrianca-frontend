import React from "react"
import { Container, Title, BackButton, Content, OptionsContainer } from "./styles"
import CircleButton from "../Buttons/CircleButton"
import { View } from "react-native"

export default function Header(props) {
    return (
        <Container backgroundColor={props.backgroundColor}>
            <Content>
                <BackButton>
                    <CircleButton icon="chevron-back" onPress={() => props.backAction ?? props.navigation.goBack()} />
                </BackButton>
                <Title titleColor={props.titleColor}>{props.title}</Title>
                <OptionsContainer>
                    {props.children}
                </OptionsContainer>
            </Content>
        </Container>
    )
}