import React from "react"
import { StatusBar } from "react-native"
import AppLoading from "expo-app-loading"
import { NavigationContainer } from "@react-navigation/native"
import { createNativeStackNavigator } from "@react-navigation/native-stack"
import { useFonts, Poppins_400Regular, Poppins_700Bold } from "@expo-google-fonts/poppins"

import Welcome from "./src/screens/Welcome"
import Login from "./src/screens/Login"
import Register from "./src/screens/Register"
import { colors } from "./src/styles"

const Stack = createNativeStackNavigator()

function App() {
    let [fontsLoaded] = useFonts({
        regular: Poppins_400Regular,
        bold: Poppins_700Bold
    })
    if (!fontsLoaded) {
        return <AppLoading />
    } else {
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
                </Stack.Navigator>
            </NavigationContainer>
        )
    }
}

export default App