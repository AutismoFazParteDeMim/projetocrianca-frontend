import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import Home from "../../screens/Home"
import Settings from "../../screens/Settings"
import Games from "../../screens/Games"
import Profile from "../../screens/Profile"
import Activity from "../../screens/Activity"
import Routines from "../../screens/Activities/Routines"
import Expressions from "../../screens/Activities/Expressions"
import Avatar from '../../screens/Avatar'
import CustomAvatar from '../../screens/Avatar/CustomAvatar'
import JogoDaMemoria from '../../screens/Games/JogoDaMemoria'

import Header from '../../components/Header'

const Stack = createNativeStackNavigator()
export default function AuthStack() {

    return (
        <Stack.Navigator
            initialRouteName="Home"
            screenOptions={{ header: props => (<Header title={props.options.title} {...props} />) }}
        >
            <Stack.Screen name="Home" component={Home} options={{ title: "Início", headerShown: false }} />
            <Stack.Screen name="Settings" component={Settings} options={{ title: "Configurações" }} />
            <Stack.Screen name="Profile" component={Profile} options={{ title: "Perfil", headerShown: false }} />
            <Stack.Screen name="Games" component={Games} options={{ title: "Jogos" }} />
            <Stack.Screen name="Activity" component={Activity} options={{ title: "Atividades" }} />
            <Stack.Screen name="Routines" component={Routines} options={{ title: "Rotinas" }} />
            <Stack.Screen name="Expressions" component={Expressions} options={{ title: "Expressões" }} />
            <Stack.Screen name="CustomAvatar" component={CustomAvatar} options={{ title: "Criar Avatar" }} />
            <Stack.Screen name="Avatar" component={Avatar} options={{ title: "Criar Avatar" }} />
            <Stack.Screen name="JogoDaMemoria" component={JogoDaMemoria} options={{ title: "Jogo da Memoria" }} />
        </Stack.Navigator>
    )
}