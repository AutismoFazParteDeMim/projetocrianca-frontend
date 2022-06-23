import { useState, useEffect } from "react"
import { Modal as RNModal } from "react-native"

import { Container, ModalView, Header, Title, Button, ButtonIcon, Icon, Content, WarningText } from "./styles"

export default function AlertModal({ visible, closeAction, title, icon, type, text }) {
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
                <ModalView type={type} >
                    <Header>
                        <Title>{title}</Title>
                        <Button onPress={closeAction}>
                            <ButtonIcon name="close-circle-outline" />
                        </Button>
                    </Header>

                    <Content>
                        <Icon name={icon} />
                        <WarningText>{text}</WarningText>
                    </Content>
                </ModalView>
            </Container>
        </RNModal>
    )
}