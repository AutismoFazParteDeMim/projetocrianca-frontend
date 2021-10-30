import React, {useContext} from 'react';
import { View, Text, TouchableOpacity, Image } from "react-native"
import { Icon } from "../../styles"
import Input from "../../components/Input/InputText"

import styles from "./styles"

import firebase from '../../config/firebase'
import { AuthenticatedUserContext } from '../../navigation/AuthenticatedUserProvider';

const auth = firebase.auth();

function Home({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);
    const handleSignOut = async () => {
        try {
            await auth.signOut();
        } catch (error) {
            console.log(error);
        }
    }
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
                <TouchableOpacity>
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