import { StatusBar } from 'expo-status-bar';
import React, { useContext } from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

import Firebase from '../../config/firebase';
import { AuthenticatedUserContext } from '../../navigation/AuthenticatedUserProvider';

const auth = Firebase.auth();

export default function About({navigation}) {
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
                <Text style={styles.title}>Sobre</Text>

            </View>
            <Text style={styles.text}>Your Name is: {user.displayName} </Text>
            <Button
                title="sobre"
                onPress={()=>navigation.navigate("Sobre")}
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