import React from "react"
import { StatusBar } from "react-native"
import { NavigationContainer } from "@react-navigation/native"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import { colors } from "./styles"
import Welcome from "./screens/Welcome"
import Login from "./screens/Login"
import Register from "./screens/Register"
import Settings from "./screens/Settings"
import Profile from "./screens/Profile"
import Routines from "./screens/Activities/Routines"
import Expressions from "./screens/Activities/Expressions"


const Stack = createNativeStackNavigator()

function Routes() {
    return (
        <NavigationContainer>
            <StatusBar
                animated={true}
                backgroundColor={colors.background}
                barStyle="dark-content"
                translucent={false}
                hidden={false} />

            <Stack.Navigator initialRouteName="Welcome" screenOptions={{ headerShown: false }}>
                <Stack.Screen name="Welcome" component={Welcome} />
                <Stack.Screen name="Login" component={Login} />
                <Stack.Screen name="Register" component={Register} />
                <Stack.Screen name="Settings" component={Settings} />
                <Stack.Screen name="Profile" component={Profile} />
                <Stack.Screen name="Routines" component={Routines} />
                <Stack.Screen name="Expressions" component={Expressions} />
            </Stack.Navigator>
        </NavigationContainer>
    )
}

export default Routes