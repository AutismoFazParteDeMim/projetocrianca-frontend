import React from "react"
import { StatusBar } from "react-native"
import { NavigationContainer } from "@react-navigation/native"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import { colors } from "./styles"

import Welcome from "./screens/Welcome"
import Login from "./screens/Login"
import Register from "./screens/Register"
import Settings from "./screens/Settings"


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
            </Stack.Navigator>
        </NavigationContainer>
    )
}

export default Routes