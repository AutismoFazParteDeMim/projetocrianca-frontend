import { useState } from "react"
import { ScrollView } from "react-native"
import { Button, Link, Text, Modal } from "../../components"
import PrivacyPolicy from "./privacyPolicy"

import { BottomContainer, Container, Title, TopContainer, WelcomeText, ButtonsContainer, PrivacyPolicyContainer } from "./styles"

export default function Welcome({ navigation }) {
    const [modalVisible, setModalVisible] = useState(false);

    return (
        <>
            <Container>
                <TopContainer>
                    <Title>Bem-Vindo(a)!</Title>
                    <WelcomeText>
                        Seja bem-vindo ao aplicativo do projeto Autismo Faz Parte de Mim.
                    </WelcomeText>
                </TopContainer>
                <BottomContainer>
                    <ButtonsContainer>
                        <Button title="Fazer Login" onPress={() => navigation.navigate("Login")} icon="log-in-outline" />
                        <Button type="secondary" title="Cadastrar" onPress={() => navigation.navigate("Register")} />
                        <Link
                            title="Política de Privacidade"
                            onPress={() => setModalVisible(true)}
                        />
                    </ButtonsContainer>
                </BottomContainer>
            </Container>
            <Modal visible={modalVisible} title="Política de Privacidade" size="medium" closeAction={() => setModalVisible(false)}>
                <PrivacyPolicyContainer>
                    <ScrollView>
                        <Text>{PrivacyPolicy}</Text>
                    </ScrollView>
                </PrivacyPolicyContainer>
            </Modal>
        </>
    )
}