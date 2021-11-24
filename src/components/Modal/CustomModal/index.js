import React, { useState, useContext } from 'react';
import { Modal, View } from 'react-native'
import ModalHeader from '../Header';

import styles from './styles'
import { ThemeContext } from "../../../styles/ThemeProvider"

function CustomModal(props) {
    const [showModal, setShowModal] = useState(props.visible)
    const { colors } = useContext(ThemeContext)

    React.useEffect(() => {
        toogleModal()
    }, [props.visible])

    const toogleModal = () => {
        props.visible ? setShowModal(true) : setShowModal(false)
    }

    return (
        <Modal animationType="fade" transparent={true} visible={showModal}>
            <View style={[styles(colors).globalContainer, styles(colors).modal, styles(colors).modal_alt]}>

                <View style={[styles(colors).container, styles(colors).container_alt]}>
                    <ModalHeader title={props.title} closeAction={props.closeAction} />
                    <View style={styles(colors).content}>
                        {props.children}
                    </View>
                </View>
            </View>
        </Modal>
    )
}

export default CustomModal