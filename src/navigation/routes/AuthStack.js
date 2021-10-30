import React from "react"
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Welcome from "../../screens/Welcome"
import Login from "../../screens/Login"
import Register from "../../screens/Register"

const Stack = createNativeStackNavigator()

function AuthStack() {
    return (
        <Stack.Navigator initialRouteName="Welcome" screenOptions={{ headerShown: false }}>
            <Stack.Screen name="Welcome" component={Welcome} />
            <Stack.Screen name="Login" component={Login} />
            <Stack.Screen name="Register" component={Register} />
        </Stack.Navigator>
    )
}

export default AuthStack