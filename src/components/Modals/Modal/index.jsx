import { useState, useEffect } from "react"
import { Modal as RNModal } from "react-native"

import { Container, ModalView, Header, Title, Button, Icon } from "./styles"

export default function Modal(props) {
    const [modalVisible, setModalVisible] = useState(props.visible);

    useEffect(() => {
        props.visible ? setModalVisible(true) : setModalVisible(false)
    }, [props.visible])

    return (
        <RNModal
            animationType="fade"
            transparent={true}
            visible={modalVisible}
            onRequestClose={props.closeAction}
            hardwareAccelerated={true}
            statusBarTranslucent={true}
        >
            <Container>
                <ModalView size={props.size}>
                    <Header>
                        <Title>{props.title}</Title>
                        <Button onPress={props.closeAction}>
                            <Icon name="close-circle-outline" />
                        </Button>
                    </Header>

                    {props.children}
                </ModalView>
            </Container>
        </RNModal>
    )
}