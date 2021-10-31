import React from "react"
import { Text, View, Image } from "react-native"
import {colors, Icon} from "../../styles"

import styles from "./styles"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import InputSearch from "./components/InputSearch"
import Button from "../../components/Button"
import CustomModal from "../../components/Modal"

function Home({ navigation }) {
    return (
        <View style={[styles.globalContainer]}>
            {/* Aqui vai o HeaderHome com a imagem e o search */}
            <View style={styles.headerHome}>
                <Icon name={"person-outline"} style={styles.iconPerson} />
                <InputSearch placeholder={'Pesquise aqui.'} icon={'ios-search'} />
            </View>

            <View style={styles.welcome}>
                <Text style={[styles.titleHome]}>Bem vindo(a)!!!</Text>
                <Text style={[styles.titleHome]}>Username:</Text>
            </View>
            
            <View style={[styles.container]}>
                <Text> Os botões vão logo a baixo</Text>
            </View>

        </View >
    )
}

export default Home