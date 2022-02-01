import React from "react"
import { View, ScrollView } from "react-native"
import { BottomContainer, Container, Title, TopContainer, WelcomeText, ButtonsContainer, PrivacyPolicyContainer } from "./styles"
import { WebView } from 'react-native-webview';
import Button from "../../components/Buttons/Button"
import Link from "../../components/Buttons/Link"
import Text from "../../components/Text"
import PrivacyPolicy from "./privacyPolicy";

export default function Welcome({ navigation }) {
    function PrivacyModal() {
        return (
            <PrivacyPolicyContainer>
                <ScrollView>
                    <Text>{PrivacyPolicy}</Text>
                </ScrollView>
            </PrivacyPolicyContainer>
        )
    }

    return (
        <Container>
            <TopContainer>
                <Title>Bem-Vindo(a)!</Title>
                <WelcomeText>
                    Lorem ipsum nunc primiskj suscipit dictumst, sociosqu vehicula morbi fermentumf litora, facilisis tristiquedwgj consectetur cubilia.
                </WelcomeText>
            </TopContainer>
            <BottomContainer>
                <ButtonsContainer>
                    <Button title="Fazer Login" onPress={() => navigation.navigate("Login")} icon="log-in-outline" />
                    <Button type="secondary" title="Cadastrar" onPress={() => navigation.navigate("Register")} />
                    <Link
                        title="Política de Privacidade"
                        onPress={() => navigation.navigate("Modal", { title: "Política de Privacidade", size: "medium", content: PrivacyModal() })}
                    />
                </ButtonsContainer>
            </BottomContainer>
        </Container>
    )
}