import React, { useState, useContext } from "react"
import { Text, View, Image, TouchableOpacity, KeyboardAvoidingView } from "react-native"

import styles from "./styles"
import InputText from "../../components/Input/InputText"
import SquareButton from "../../components/Button/SquareButton"
import WarningModal from "../../components/Modal/WarningModal"

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"

function Home({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);

    return (
        <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : "height"}
            style={{ flex: 1 }}
        >

            <View style={styles.headerHome}>
                <TouchableOpacity onPress={() => navigation.navigate("Profile")}>
                    <Image style={styles.iconPerson} source={require('../../../assets/User.jpg')} />
                </TouchableOpacity>
                <View style={styles.containerInputSearch}>
                    <InputText placeholder='Pesquise aqui.' icon={'ios-search'} />
                </View>
            </View>

            <View style={styles.globalContainer}>
                <Text style={styles.globalSubtitle}>Bem-vindo(a)!! {"\n" + user.displayName}</Text>
                <View style={styles.container}>
                    <View style={styles.grid}>
                        <SquareButton type='secondary' image={require('../../../assets/books.png')} title="Atividades" />
                        <SquareButton type='secondary' image={require('../../../assets/parque-infantil.png')} title="Jogos" />

                    </View>
                    <View style={styles.grid}>
                        <SquareButton type='secondary' image={require('../../../assets/cogwheel.png')} title="Configurações" onPress={() => navigation.navigate("Settings")} />
                    </View>
                </View>
            </View>

        </KeyboardAvoidingView >
    )
}

export default Home