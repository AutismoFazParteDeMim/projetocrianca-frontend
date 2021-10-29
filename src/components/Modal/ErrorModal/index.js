import React, { useState } from 'react';
import { Modal, View, Text } from 'react-native'
import ModalHeader from '../Header';
import { colors, Icon } from '../../../styles';
import Icons from '@expo/vector-icons/Feather'  // novo import de outra biblioteca do expo

import styles from './styles'

function ErrorModal(props) {
    const [showModal, setShowModal] = useState(props.visible)

    React.useEffect(() => {
        toogleModal()
    }, [props.visible])

    const toogleModal = () => {
        props.visible ? setShowModal(true) : setShowModal(false)
    }

    return (
        <Modal animationType="fade" transparent={true} visible={showModal}>
            <View style={[styles.globalContainer, styles.modal]} >

                <View style={[styles.container, styles.container_alt]}>
                    <ModalHeader closeAction={props.closeAction} color={colors.text_alt} title="Erro!" />
                    <View style={styles.content}>
                        <Icons name="alert-octagon" style={[styles.icon]} />
                        <Text style={styles.text}>{props.text}</Text>
                    </View>
                </View>
            </View>
        </Modal>
    )
}

export default ErrorModal