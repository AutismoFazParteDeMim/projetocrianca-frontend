import React, { useState, useContext } from "react"
import { Text, View, Image, TouchableOpacity, KeyboardAvoidingView } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"

import Icon from "../../styles/icons";

import { ThemeContext } from "../../styles/ThemeProvider"

function Activity({ navigation }) {
    const { colors } = useContext(ThemeContext)

    return (
        <View style={{ flex: 1 }}>
            <Header title="Atividades" navigation={navigation} />
            <View style={styles(colors).globalContainer}>
                <TouchableOpacity style={styles(colors).item} onPress={() => navigation.navigate("Routines")}>
                    <Image source={require("../../../assets/routines.png")} style={styles(colors).itemImage} />
                    <View style={styles(colors).itemText}>
                        <Text style={styles(colors).globalSubtitle}>Rotinas</Text>
                        <Text style={styles(colors).globalText}>Trabalha estabelecer a relação do numero com a quantidade, percepção visual, etc.</Text>
                    </View>
                    <Icon name="arrow-forward" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                </TouchableOpacity>
                <TouchableOpacity style={styles(colors).item} onPress={() => navigation.navigate("Expressions")}>
                    <Image source={require("../../../assets/expressions.png")} />
                    <View style={styles(colors).itemText}>
                        <Text style={styles(colors).globalSubtitle}>Expressões</Text>
                        <Text style={styles(colors).globalText}>Trabalha estabelecer a relação do numero com a quantidade, percepção visual, etc.</Text>
                    </View>
                    <Icon name="arrow-forward" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                </TouchableOpacity>
            </View>
        </View>
    )
}

export default Activity