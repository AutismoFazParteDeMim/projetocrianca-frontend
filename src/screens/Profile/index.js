import React, { useContext } from "react"
import { View, Text, ImageBackground, Image, ScrollView } from "react-native";
import styles from "./styles"

import Icon from "../../styles/icons";
import Header from "../../components/Header";

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"
import { ThemeContext } from "../../styles/ThemeProvider"
function Profile({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext)
    const { colors } = useContext(ThemeContext)

    return (
        <View style={{ flex: 1 }}>
            <View>
                <ImageBackground source={require("../../../assets/background.png")} style={{ height: 200 }} resizeMode="cover">
                    <Header navigation={navigation} transparent={true} />
                </ImageBackground>
                <View style={styles(colors).infos}>
                    <Image source={require("../../../assets/User.jpg")} style={styles(colors).profilePic} />
                    <View style={styles(colors).userData}>
                        <Text style={[styles(colors).globalTitle, styles(colors).title]}>{user.displayName}</Text>
                        <Icon name="checkmark-circle-outline" style={[styles(colors).globalIcon, styles(colors).icon]} />
                    </View>
                </View>
            </View>

            <View style={styles(colors).globalContainer}>
                <View style={styles(colors).item}>
                    <View style={styles(colors).itemTitle}>
                        <Icon name="bookmark-outline" style={[styles(colors).iconTitle, styles(colors).globalIcon]} />
                        <Text>Marcadores</Text>
                    </View>
                    <Icon name="arrow-forward-outline" style={styles(colors).globalIcon} />
                </View>
                <ScrollView>

                </ScrollView>
            </View>
        </View>
    )
}
export default Profile
