import React from 'react';
import {View, Text} from "react-native";
import Header from "../../components/Header";

import styles from "./styles"
import Icon from "../../styles/icons"
import Button from "../../components/Button";

function Settings ({ navigation }) {
    return (
        <View style={styles.globalContainer}>
            <Header title="Configurações" navigation={navigation} />
            <View style={styles.container}>
                <View style={styles.titulo1}>
                    <Text>Interface</Text>
                </View>
                <View style={styles.conteudoInterface1}>
                    <Icon name="moon-outline" size={20} color="#000"/>
                    <Text>Tema escuro</Text>
                    <Icon name="toggle" size={20} color="#000"/>
                </View>
                <View style={styles.conteudoInterface2}>
                    <Icon name="contrast" size={20} color="#000"/>
                    <Text>Modo daltônico</Text>
                    <Icon name="toggle" size={20} color="#000"/>
                </View>
                <View style={styles.titulo2}>
                    <Text>Aplicativo</Text>
                </View>
                <View style={styles.conteudoAplicativo}>
                    <Icon name="information-circle-outline" size={20} color="#000"/>
                    <Text>Saiba mais</Text>
                    <Icon name="arrow-forward-outline" size={20} color="#000"/>
                </View>
            </View>
            <View style={styles.bottomSide}>
                <Button  title="Logout" icon="log-in-outline" onPress={() => navigation.navigate('Welcome')} />
            </View>
        </View>
    )
}
export default Settings