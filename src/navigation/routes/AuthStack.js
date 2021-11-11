import React from "react"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Home from "../../screens/Home"
import Settings from "../../screens/Settings"
import Profile from "../../screens/Profile"


const Stack = createNativeStackNavigator()

function AuthStack() {
    return (
        <Stack.Navigator initialRouteName="Home" screenOptions={{ headerShown: false }}>
            <Stack.Screen name="Home" component={Home} />
            <Stack.Screen name="Settings" component={Settings} />
            <Stack.Screen name="Profile" component={Profile} />
        </Stack.Navigator>
    )
}

export default AuthStack