import React from "react"
import { Text, View, Image } from "react-native"


import styles from "./styles"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal"

function Home({ navigation }) {
    return (
        <View style={[styles.globalContainer]}>
            {/* Aqui vai o HeaderHome com a imagem e o search */}

            <View>
                <Text style={[styles.headerHomeText]}>Bem vindo(a)!!!</Text>
                <Text style={[styles.headerHomeText]}>Username:</Text>
            </View>
            <View style={[styles.container]}>
                <Text> Os botões vão logo a baixo</Text>
            </View>

        </View >
    )
}

export default Home