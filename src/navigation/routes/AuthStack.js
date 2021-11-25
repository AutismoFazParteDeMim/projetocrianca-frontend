import React from "react"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Home from "../../screens/Home"
import Settings from "../../screens/Settings"
import Profile from "../../screens/Profile"
import Activity from "../../screens/Activity"
import Routines from "../../screens/Activities/Routines"
import Expressions from "../../screens/Activities/Expressions"

const Stack = createNativeStackNavigator()

function AuthStack() {
    return (
        <Stack.Navigator initialRouteName="Home" screenOptions={{ headerShown: false }}>
            <Stack.Screen name="Home" component={Home} />
            <Stack.Screen name="Settings" component={Settings} />
            <Stack.Screen name="Profile" component={Profile} />
            <Stack.Screen name="Activity" component={Activity} />
            <Stack.Screen name="Routines" component={Routines} />
            <Stack.Screen name="Expressions" component={Expressions} />
        </Stack.Navigator>
    )
}

export default AuthStack