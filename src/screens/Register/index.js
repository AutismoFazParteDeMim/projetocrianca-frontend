import React from "react"
import { Text, View, Image } from "react-native"


import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal/CustomModal"

function Register({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)
    return (
        <View style={[styles.globalContainer]}>
            <Header title="Cadastre-se" navigation={navigation} />

            <View style={[styles.container]}>
                <Image source={require('../../../assets/animais.png')} style={styles.image} />

                <InputText type="name" icon="person-circle-outline" placeholder="Insira seu nome e sobrenome" autoCapitalize="words" />
                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Crie uma senha" />
                <Button icon="arrow-forward-outline" iconPosition="right" title="Próximo" onPress={() => setShowModal(true)} />
            </View>

            <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                <Text>Qual o nome da criança? Essa informação será útil para personalizar a experiência!</Text>
                <InputText type="name" icon="person-circle-outline" placeholder="Insira o nome e sobrenome" autoCapitalize="words" />
                <Button icon="checkmark-circle-outline" iconPosition="left" title="Concluído" onPress={() => navigation.navigate("Welcome")} />
            </CustomModal>
        </View >
    )
}

export default Register