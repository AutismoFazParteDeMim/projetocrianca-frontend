import React from 'react';
import { createNativeStackNavigator } from "@react-navigation/native-stack"

import Home from '../screens/Home';

import Config from '../screens/Config';

const Stack = createNativeStackNavigator();

export default function HomeStack() {
    return (
        <Stack.Navigator initialRouteName="Home" screenOptions={{ headerShown: false }}>
            <Stack.Screen name='Home' component={Home} />
            <Stack.Screen name='Config' component={Config} />
        </Stack.Navigator>
    );
}