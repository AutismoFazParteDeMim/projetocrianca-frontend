import React from 'react'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import Home from "../../screens/Home"
import Settings from "../../screens/Settings"
import Games from "../../screens/Games"
import Profile from "../../screens/Profile"
import Activity from "../../screens/Activity"
import Routines from "../../screens/Activities/Routines"
import Expressions from "../../screens/Activities/Expressions"

import Header from '../../components/Header'
import EscolhaSexo from '../../screens/Avatar/EscolhaSexo'

const Stack = createNativeStackNavigator()
export default function AuthStack() {
    return (
        <Stack.Navigator
            initialRouteName="EscolhaSexo"
            screenOptions={{ header: props => (<Header title={props.options.title} {...props} />) }}
        >
            <Stack.Screen name="Home" component={Home} options={{ title: "Início", headerShown: false }} />
            <Stack.Screen name="Settings" component={Settings} options={{ title: "Configurações" }} />
            <Stack.Screen name="Profile" component={Profile} options={{ title: "Perfil", headerShown: false }} />
            <Stack.Screen name="Games" component={Games} options={{ title: "Jogos" }} />
            <Stack.Screen name="Activity" component={Activity} options={{ title: "Atividades" }} />
            <Stack.Screen name="Routines" component={Routines} options={{ title: "Rotinas" }} />
            <Stack.Screen name="Expressions" component={Expressions} options={{ title: "Expressões" }} />
            <Stack.Screen name="EscolhaSexo" component={EscolhaSexo} options={{ title: "Sexo da criança" }} />
            {/* <Stack.Screen name="CustomAvatar" component={CustomAvatar} options={{ title: "Customize o avatar" }} /> */}
        </Stack.Navigator>
    )
}