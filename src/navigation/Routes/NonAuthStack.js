import React from "react"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Welcome from "../../screens/Welcome"
import Login from "../../screens/Login"
import Register from "../../screens/Register"
import Modal from "../../components/Modals/Modal"
import AlertModal from "../../components/Modals/AlertModal"


import Header from "../../components/Header"

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
            <Stack.Screen name="Modal" component={Modal} options={{ headerShown: false, presentation: "transparentModal" }} />
            <Stack.Screen name="AlertModal" component={AlertModal} options={{ headerShown: false, presentation: "transparentModal" }} />
        </Stack.Navigator>
    )
}