import { useState, useEffect } from "react"
import { Modal as RNModal } from "react-native"

import { Container, ModalView, Header, Title, Button, Icon } from "./styles"

export default function Modal({ visible, title, closeAction, children, size }) {
    const [modalVisible, setModalVisible] = useState(visible);

    useEffect(() => {
        visible ? setModalVisible(true) : setModalVisible(false)
    }, [visible])

    return (
        <RNModal
            animationType="fade"
            transparent={true}
            visible={modalVisible}
            onRequestClose={closeAction}
            hardwareAccelerated={true}
            statusBarTranslucent={true}
        >
            <Container>
                <ModalView size={size}>
                    <Header>
                        <Title>{title}</Title>
                        <Button onPress={closeAction}>
                            <Icon name="close-circle-outline" />
                        </Button>
                    </Header>

                    {children}
                </ModalView>
            </Container>
        </RNModal>
    )
}