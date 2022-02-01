import React, { useState } from "react"
import { Modal as RNModal } from "react-native";

import { Container, ModalView, Header, Title, Button, Icon } from "./styles.js"

export default function Modall({ navigation, route }) {
    const [modalVisible, setModalVisible] = useState(true);

    function closeModal() {
        setModalVisible(!modalVisible);
        navigation.goBack();
    }

    return (
        <RNModal
            animationType="fade"
            transparent={true}
            visible={modalVisible}
            onRequestClose={() => closeModal()}
            hardwareAccelerated={true}
        >
            <Container onPress={() => closeModal()}>
                <ModalView size={route.params.size}>
                    <Header>
                        <Title>{route.params.title}</Title>
                        <Button onPress={() => closeModal()}>
                            <Icon name="close-circle-outline" />
                        </Button>
                    </Header>

                    {route.params.content}
                </ModalView>
            </Container>
        </RNModal>
    )
}