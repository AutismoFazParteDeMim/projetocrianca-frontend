import React, { useState, useEffect } from "react"
import { Modal as RNModal } from "react-native";
import Text from "../../Text/index.js";

import { Container, ModalView, Header, Title, Button, ButtonIcon, Icon, Content, WarningText } from "./styles.js"

export default function AlertModal(props) {
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
                <ModalView type={props.type} >
                    <Header>
                        <Title>{props.title}</Title>
                        <Button onPress={props.closeAction}>
                            <ButtonIcon name="close-circle-outline" />
                        </Button>
                    </Header>

                    <Content>
                        <Icon name={props.icon} />
                        <WarningText>{props.text}</WarningText>
                    </Content>
                </ModalView>
            </Container>
        </RNModal>
    )
}