import React, { useState } from "react"
import { Modal as RNModal } from "react-native";
import Text from "../../Text/index.js";

import { Container, ModalView, Header, Title, Button, ButtonIcon, Icon, Content, WarningText } from "./styles.js"

export default function AlertModal({ navigation, route }) {
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
            onRequestClose={() => route.params.onRequestClose()}
            hardwareAccelerated={true}
            statusBarTranslucent={true}
        >
            <Container>
                <ModalView type={route.params.type} >
                    <Header>
                        <Title>{route.params.title}</Title>
                        <Button onPress={() => closeModal()}>
                            <ButtonIcon name="close-circle-outline" />
                        </Button>
                    </Header>

                    <Content>
                        <Icon name={route.params.icon} />
                        <WarningText>{route.params.text}</WarningText>
                    </Content>
                </ModalView>
            </Container>
        </RNModal>
    )
}