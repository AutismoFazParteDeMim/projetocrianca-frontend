import React, { useState, useContext } from "react"
import { Text, View, Image, TouchableOpacity, KeyboardAvoidingView } from "react-native"

import styles from "./styles"
import InputText from "../../components/Input/InputText"
import SquareButton from "../../components/Button/SquareButton"

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"
import { ThemeContext } from "../../styles/ThemeProvider"

function Home({ navigation }) {
    const { user, child } = useContext(AuthenticatedUserContext)
    const { colors } = useContext(ThemeContext)

    return (
        <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : "height"}
            style={{ flex: 1 }}
        >

            <View style={styles(colors).headerHome}>
                <TouchableOpacity onPress={() => navigation.navigate("Profile")}>
                    <Image style={styles(colors).iconPerson} source={require("../../../assets/icon.png")} />
                </TouchableOpacity>
                <View style={styles(colors).containerInputSearch}>
                    <InputText placeholder="Pesquise aqui." icon={"ios-search"} />
                </View>
            </View>

            <View style={styles(colors).globalContainer}>
                <Text style={styles(colors).globalSubtitle}>Bem-vindo(a)!! {"\n" + child.childsName}</Text>
                <View style={styles(colors).container}>
                    <View style={styles(colors).grid}>
                        <SquareButton type="secondary" image={require("../../../assets/books.png")} title="Atividades" onPress={() => navigation.navigate("Activity")} />
                        <SquareButton type="secondary" image={require("../../../assets/parque-infantil.png")} title="Jogos" />

                    </View>
                    <View style={styles(colors).grid}>
                        <SquareButton type="secondary" image={require("../../../assets/cogwheel.png")} title="Configurações" onPress={() => navigation.navigate("Settings")} />
                    </View>
                </View>
            </View>

        </KeyboardAvoidingView >
    )
}

export default Home