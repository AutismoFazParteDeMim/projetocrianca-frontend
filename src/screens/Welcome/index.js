import React from "react"
import { Text, View, SafeAreaView, ScrollView } from "react-native"

import styles from "./styles"

import Button from "../../components/Button"
import Link from "../../components/Link"
import CustomModal from "../../components/Modal"

function Welcome({ navigation }) {
    const [showModal, setShowModal] = React.useState(false)
    return (
        <View style={styles.container}>
            <View style={styles.topSide}>
                <Text style={[styles.globalTitle, styles.text, styles.title]}>Seja Bem Vindo(a)!</Text>
                <Text style={[styles.globalText, styles.text]}>Esse aplicativo serve para o auxílio de cuidados e desenvolvimentos de crianças autistas por seus país.</Text>
            </View>

            <View style={styles.bottomSide}>
                <Button title="Faça login" onPress={() => navigation.navigate('Login')} />
                <Button type="secondary" title="Crie uma conta" onPress={() => navigation.navigate('Register')} />
                <Link text="Política de privacidade" onPress={() => setShowModal(true)} />
            </View>

            <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                <ScrollView>
                    <Text>
                        Esse aplicativo coleta e armazena informações pessoais sobre seu usuário, com a finalidade de oferecer recursos relacionados ao aplicativo, nós não compartilhamos suas informações com terceiros. Ao utilizar esse aplicativo, você concorda em ter essas informações coletadas e utilizadas por nós, estudantes do Curso de Extensão da UniSociesc.
                    </Text>
                </ScrollView>
            </CustomModal>
        </View>
    )
}

export default Welcome