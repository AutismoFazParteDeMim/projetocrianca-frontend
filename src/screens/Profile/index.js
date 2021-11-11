import React, { useContext } from "react"
import { View, Text, ImageBackground, Image, ScrollView } from "react-native";
import styles from "./styles"

import Icon from "../../styles/icons";
import Header from "../../components/Header";

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"

function Profile({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);
    return (
        <View style={{ flex: 1 }}>
            <View>
                <ImageBackground source={require("../../../assets/background.png")} style={{ height: 200 }} resizeMode="cover">
                    <Header navigation={navigation} transparent={true} />
                </ImageBackground>
                <View style={styles.infos}>
                    <Image source={require("../../../assets/User.jpg")} style={styles.profilePic} />
                    <View style={styles.userData}>
                        <Text style={[styles.globalTitle, styles.title]}>{user.displayName}</Text>
                        <Icon name="checkmark-circle-outline" style={[styles.globalIcon, styles.icon]} />
                    </View>
                </View>
            </View>

            <View style={styles.globalContainer}>
                <View style={styles.item}>
                    <View style={styles.itemTitle}>
                        <Icon name="bookmark-outline" style={[styles.iconTitle, styles.globalIcon]} />
                        <Text style={styles.globalText}>Marcadores</Text>
                    </View>
                    <Icon name="arrow-forward-outline" style={styles.globalIcon} />
                </View>
                <ScrollView>

                </ScrollView>
            </View>
        </View>
    )
}
export default Profile
