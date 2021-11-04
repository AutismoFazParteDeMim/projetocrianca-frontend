import React from "react"
import { Text, View, ScrollView } from "react-native"

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
                <Text style={[styles.globalText, styles.text]}>Lorem ipsum nunc primiskj suscipit dictumst, sociosqu vehicula morbi fermentumf litora, facilisis tristiquedwgj  consectetur cubilia.</Text>
            </View>

            <View style={styles.bottomSide}>
                <Button title="Faça login" onPress={() => navigation.navigate('Login')} />
                <Button type="secondary" title="Crie uma conta" onPress={() => navigation.navigate('Register')} />
                <Link text="Política de privacidade" onPress={() => setShowModal(true)} />
            </View>

            <CustomModal visible={showModal} title="Cadastro" closeAction={() => setShowModal(false)}>
                <ScrollView>
                    <Text>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Adipiscing sed sapien auctor integer. Urna, eros sit accumsan ultricies pharetra eget interdum nibh. Sit mi consectetur pellentesque urna quis. Praesent commodo commodo, justo, turpis nisi, tristique arcu.

                        Auctor sem lacus, morbi vel. In blandit quam senectus ullamcorper. Tempor, quis vitae posuere vel, suspendisse ut bibendum at. Duis sed nullam tortor consectetur duis arcu. Consectetur massa et sagittis sit lacus consectetur lectus.
                        Enim tortor et imperdiet fermentum quam. Dolor, aliquet feugiat mattis pharetra.

                        *Nec ac suspendisse auctor et semper. Dignissim commodo volutpat lacus, enim mattis est mattis viverra. Lacinia non mattis elit nulla urna, rhoncus mattis volutpat. Tortor commodo placerat mus sem amet velit.
                        *Amet, magna congue vitae, fermentum viverra natoque felis praesent. Tempus porttitor et.
                    </Text>
                </ScrollView>
            </CustomModal>
        </View>
    )
}

export default Welcome