import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import Home from "../../screens/Home"
import Settings from "../../screens/Settings"
import Games from "../../screens/Games"
import Profile from "../../screens/Profile"
import Activity from "../../screens/Activity"
import Routines from "../../screens/Activity/Activities/Routines"
import Expressions from "../../screens/Activity/Activities/Expressions"
import Avatar from '../../screens/Avatar'
import CustomAvatar from '../../screens/Avatar/CustomAvatar'
import MemoryGame from '../../screens/Games/MemoryGame'
import MemoryGame2 from '../../screens/Games/MemoryGame/MemoryGame2'
import About from "../../screens/About"
import Tutorial from '../../screens/Tutorial'

import { Header } from '../../components'


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
            <Stack.Screen name="MemoryGame" component={MemoryGame} options={{ title: "Jogo da Memoria", headerShown: false }} />
            <Stack.Screen name="MemoryGame2" component={MemoryGame2} options={{ title: "Jogo da Memoria", headerShown: false }} />
            <Stack.Screen name="About" component={About} options={{ title: "Sobre o projeto"}} />
            <Stack.Screen name="Tutorial" component={Tutorial} options={{ title: "Tutorial", headerShown:false}} />
        </Stack.Navigator>
    )
}