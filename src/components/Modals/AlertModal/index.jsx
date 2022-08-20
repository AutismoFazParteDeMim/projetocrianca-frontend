import { useState, useEffect } from "react"
import { Modal as RNModal } from "react-native"

import { Container, ModalView, Header, Title, Button, ButtonIcon, Icon, Content, WarningText } from "./styles"

export default function AlertModal({ visible, closeAction, title, icon, type, text }) {
    return (
        <RNModal
            animationType="fade"
            transparent={true}
            visible={visible}
            onRequestClose={closeAction}
            hardwareAccelerated={true}
            statusBarTranslucent={true}
        >
            <Container>
                <ModalView type={type} >
                    <Header>
                        <Title type={type}>{title}</Title>
                        <Button onPress={closeAction}>
                            <ButtonIcon name="close-circle-outline" type={type} />
                        </Button>
                    </Header>

                    <Content>
                        <Icon name={icon} type={type} />
                        <WarningText type={type}>{text}</WarningText>
                    </Content>
                </ModalView>
            </Container>
        </RNModal>
    )
}