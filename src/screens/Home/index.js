import React, {useContext} from 'react';
import { View, Text, TouchableOpacity, Image } from "react-native"
import { Icon } from "../../styles"
import Input from "../../components/Input/InputText"

import styles from "./styles"

import { AuthenticatedUserContext } from '../../navigation/AuthenticatedUserProvider';


function Home({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);

    return (
        <View style={styles.container}>
            <View>
                <Icon name="person-circle-outline" size={25} color="#00A7DF" />
                <Icon name="search-outline" size={25} color="#000" />
                <Input />
            </View>
            <View >
                <Text>Bem Vindo (a) {user.displayName}</Text>
            </View>
            <View>
                <TouchableOpacity onPress={() => navigation.navigate("Settings")}>
                    <Image
                        source={require('../../assets/books.png')} />
                    <Image
                        source={require('../../assets/cogwheel.png')} />
                    <Image
                        source={require('../../assets/parque-infantil.png')} />
                </TouchableOpacity>
            </View>
        </View>
    )
}

export default Home