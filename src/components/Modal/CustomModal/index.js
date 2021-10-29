import React, { useState } from 'react';
import { Modal, View } from 'react-native'
import ModalHeader from '../Header';

import styles from './styles'

function CustomModal(props) {
    const [showModal, setShowModal] = useState(props.visible)

    React.useEffect(() => {
        toogleModal()
    }, [props.visible])

    const toogleModal = () => {
        props.visible ? setShowModal(true) : setShowModal(false)
    }

    return (
        <Modal animationType="fade" transparent={true} visible={showModal}>
            <View style={[styles.globalContainer, styles.modal, styles.modal_alt]}>

                <View style={[styles.container, styles.container_alt]}>
                    <ModalHeader title={props.title} closeAction={props.closeAction} />
                    <View style={styles.content}>
                        {props.children}
                    </View>
                </View>
            </View>
        </Modal>
    )
}

export default CustomModal