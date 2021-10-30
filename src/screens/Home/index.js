<<<<<<< HEAD
import { StatusBar } from 'expo-status-bar';
import React, { useContext } from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

import Firebase from '../../config/firebase';
import { AuthenticatedUserContext } from '../../navigation/AuthenticatedUserProvider';

const auth = Firebase.auth();

export default function Home({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);
    const handleSignOut = async () => {
        try {
            await auth.signOut();
        } catch (error) {
            console.log(error);
        }
    };
    return (
        <View style={styles.container}>
            <StatusBar style='dark-content' />
            <View style={styles.row}>
                <Text style={styles.title}>Welcome {user.email}!</Text>

            </View>
            <Text style={styles.text}>Your UID is: {user.uid} </Text>
            <Text style={styles.text}>Your Name is: {user.displayName} </Text>
            <Button
                title="Sair"
                onPress={handleSignOut}
            />
            <Button
                title="Config"
                onPress={() => navigation.navigate('Config')}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#e93b81',
        paddingTop: 50,
        paddingHorizontal: 12
    },
    row: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        marginBottom: 24
    },
    title: {
        fontSize: 24,
        fontWeight: '600',
        color: '#fff'
    },
    text: {
        fontSize: 16,
        fontWeight: 'normal',
        color: '#fff'
    }
})
=======
import React from "react"
import {View, Text, TouchableOpacity, Image} from "react-native"
import Icon from "@expo/vector-icons/Ionicons";
import Input from "../../components/Input/InputText";
import styles from "./styles";


function Home({ navigation }) {
    return (
        <View style={styles.container}>
            <View>
                <Icon name="person-circle-outline" size={25} color="#00A7DF"/>
                <Icon name="search-outline" size={25} color="#000"/>
                <Input/>
            </View>
            <View >
                <Text>Bem Vindo (a) Nome!</Text>
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
>>>>>>> main
