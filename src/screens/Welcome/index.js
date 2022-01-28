import React from "react"
import { View } from "react-native"
import { BottomContainer, Container, Title, TopContainer, WelcomeText, ButtonsContainer } from "./styles"
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"
import Text from "../../components/Text"

export default function Welcome({ navigation }) {
    return (
        <Container>
            <TopContainer>
                <Title>Bem-Vindo(a)!</Title>
                <WelcomeText>
                    Lorem ipsum nunc primiskj suscipit dictumst, sociosqu vehicula morbi fermentumf litora, facilisis tristiquedwgj  consectetur cubilia.
                </WelcomeText>
            </TopContainer>
            <BottomContainer>
                <ButtonsContainer>
                    <Button title="Fazer Login" onPress={() => navigation.navigate("Login")} icon="log-in-outline" />
                    <Button type="secondary" title="Cadastrar" onPress={() => navigation.navigate("Register")} />
                    <Link title="Política de Privacidade" />
                </ButtonsContainer>
            </BottomContainer>
        </Container>
    )
}