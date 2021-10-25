import React from 'react';
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Welcome from '../screens/Welcome';
import Login from '../screens/Login';
import Register from '../screens/Register';

const Stack = createNativeStackNavigator();

export default function AuthStack() {
    return (
        <Stack.Navigator screenOptions={{ headerShown: false }}>
            <Stack.Screen name='Welcome' component={Welcome} />
            <Stack.Screen name='Login' component={Login} />
            <Stack.Screen name='Signup' component={Register} />
        </Stack.Navigator>
    );
}