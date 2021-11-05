import React from "react"
import {View, Text} from "react-native";
import styles from "./styles"

import Icon from "../../styles/icons";
import Header from "../../components/Header";

function Profile({ navigation }) {
    return (
        <View style={styles.globalContainer}>
            <View style={styles.container}>
                <Header/>
                        <View style={styles.itemTitle}>
                            <Icon name="person-circle-outline" style={styles.iconProfile}/>
                            <Text style={styles.globalTitle}>UserName.   </Text>
                            <Icon name="checkmark-circle-outline" style={[styles.globalIcon ,styles.iconTitle ]}/>
                        </View>
                        <View style={styles.item}>
                            <View style={styles.itemTitle} >
                                <Icon name="bookmark-outline" style={[styles.icons, styles.globalIcon]}/>
                                <Text style={styles.globalText}>Bookmarks</Text>
                            </View>
                                <Icon name="arrow-forward-outline" style={[styles.icons, styles.globalIcon]}/>
                    </View>
                </View>
            </View>
    )
}
export default Profile
