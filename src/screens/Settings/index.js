import React, { useContext } from 'react';
import { View, Text, TouchableOpacity, Switch } from "react-native";

import styles from "./styles";
import Icon from "../../styles/icons";
import Header from "../../components/Header";
import ButtonLogout from "../../components/ButtonLogout";

import { auth } from '../../config/firebase'
import { ThemeContext } from "../../styles/ThemeProvider"

function Settings({ navigation }) {
    const { colors, theme, setDarkMode } = useContext(ThemeContext)

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
            <View style={styles(colors).globalContainer}>
                <View style={styles(colors).container}>
                    <View style={styles(colors).sessao}>
                        <Text style={[styles(colors).globalText, styles(colors).titulo]}>Interface</Text>
                        <TouchableOpacity style={styles(colors).item} onPress={setDarkMode}>
                            <View style={styles(colors).itemTitle}>
                                <Icon name="moon-outline" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                                <Text>Tema escuro</Text>
                            </View>
                            <Switch
                                trackColor={{ false: colors.inputBackground_shadow, true: colors.primary }}
                                thumbColor={colors.text_alt_light}
                                ios_backgroundColor={colors.inputBackground_shadow}
                                onValueChange={setDarkMode}
                                value={theme === "light" ? false : true}
                            />
                        </TouchableOpacity>
                        <View style={styles(colors).item}>
                            <View style={styles(colors).itemTitle}>
                                <Icon name="contrast" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                                <Text>Modo daltônico</Text>
                            </View>
                            <Icon name="toggle" style={styles(colors).globalIcon} />
                        </View>
                    </View>
                    <View style={styles(colors).sessao}>
                        <Text style={[styles(colors).globalText, styles(colors).titulo]}>Aplicativo</Text>
                        <View style={styles(colors).item}>
                            <View style={styles(colors).itemTitle}>
                                <Icon name="information-circle-outline" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                                <Text>Saiba mais</Text>
                            </View>
                            <Icon name="arrow-forward-outline" style={styles(colors).globalIcon} />
                        </View>
                    </View>
                    <View style={styles(colors).buttonLogout}>
                        <ButtonLogout title="Logout" icon="log-in-outline" onPress={() => handleSignOut()} />
                    </View>
                </View>
            </View>
        </View>
    )
}
export default Settings