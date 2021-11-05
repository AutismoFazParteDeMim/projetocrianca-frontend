import React from 'react';
import { View, Text } from "react-native";

import styles from "./styles";
import Icon from "../../styles/icons";
import Header from "../../components/Header";
import ButtonLogout from "../../components/ButtonLogout";

import {auth} from '../../config/firebase'

function Settings({ navigation }) {
    async function handleSignOut() {
        try {
            await auth.signOut();
        } catch (error) {
            console.log(error);
        }
    }

    return (
        <View style={{ flex: 1 }}>
            <Header title="Configurações" navigation={navigation} />
            <View style={styles.globalContainer}>
                <View style={styles.container}>
                    <View style={styles.sessao}>
                        <Text style={[styles.globalText, styles.titulo]}>Interface</Text>
                        <View style={styles.item}>
                            <View style={styles.itemTitle}>
                                <Icon name="moon-outline" style={[styles.iconTitle, styles.globalIcon]} />
                                <Text>Tema escuro</Text>
                            </View>
                            <Icon name="toggle" style={styles.globalIcon} />
                        </View>
                        <View style={styles.item}>
                            <View style={styles.itemTitle}>
                                <Icon name="contrast" style={[styles.iconTitle, styles.globalIcon]} />
                                <Text>Modo daltônico</Text>
                            </View>
                            <Icon name="toggle" style={styles.globalIcon} />
                        </View>
                    </View>
                    <View style={styles.sessao}>
                        <Text style={[styles.globalText, styles.titulo]}>Aplicativo</Text>
                        <View style={styles.item}>
                            <View style={styles.itemTitle}>
                                <Icon name="information-circle-outline" style={[styles.iconTitle, styles.globalIcon]} />
                                <Text>Saiba mais</Text>
                            </View>
                            <Icon name="arrow-forward-outline" style={styles.globalIcon} />
                        </View>
                    </View>
                    <View style={styles.buttonLogout}>
                        <ButtonLogout title="Logout" icon="log-in-outline" onPress={() => handleSignOut()} />
                    </View>
                </View>
            </View>
        </View>
    )
}
export default Settings