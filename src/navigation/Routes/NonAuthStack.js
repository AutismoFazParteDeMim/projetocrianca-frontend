import React from "react"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Welcome from "../../screens/Welcome"
import Login from "../../screens/Login"
import Register from "../../screens/Register"

import {Header} from "../../components"


const Stack = createNativeStackNavigator()
export default function NonAuthStack() {
    return (
        <Stack.Navigator
            initialRouteName="Welcome"
            screenOptions={{ header: props => (<Header title={props.options.title} {...props} />) }}
        >
            <Stack.Screen name="Welcome" component={Welcome} options={{ title: "Bem-Vindo(a)!", headerShown: false }} />
            <Stack.Screen name="Login" component={Login} options={{ title: "Login" }} />
            <Stack.Screen name="Register" component={Register} options={{ title: "Cadastre-se" }} />
            
        </Stack.Navigator>
    )
}