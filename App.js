import "expo-dev-client"
import React from 'react'
import { useFonts, Poppins_400Regular, Poppins_500Medium, Poppins_700Bold } from '@expo-google-fonts/poppins'
import AppLoading from 'expo-app-loading'
import { NavigationContainer } from "@react-navigation/native"
import { ThemeProvider } from 'styled-components/native'
import { ThemeProvider as RNEThemeProvider } from 'react-native-elements'
import { StatusBar } from "expo-status-bar"

import { Provider as StoreProvider, useSelector } from 'react-redux'
import { store, persistor } from './src/redux'
import { PersistGate } from "redux-persist/integration/react"

import Routes from "./src/navigation"

import { LogBox } from 'react-native'

function AppContent() {
    const { theme } = useSelector((state) => state.settings)
    let [fontsLoaded] = useFonts({
        "regular": Poppins_400Regular,
        "medium": Poppins_500Medium,
        "bold": Poppins_700Bold
    })

    if (!fontsLoaded) {
        return <AppLoading />
    } else {
        return (
            <NavigationContainer theme={theme}>
                <ThemeProvider theme={theme}>
                    <RNEThemeProvider useDark={theme.dark} theme={theme}>
                        <StatusBar style={theme.dark ? "light" : "dark"} />
                        <Routes />
                    </RNEThemeProvider>
                </ThemeProvider>
            </NavigationContainer>
        )
    }
}

export default function App() {
    return (
        <StoreProvider store={store}>
            <PersistGate loading={null} persistor={persistor}>
                <AppContent />
            </PersistGate>
        </StoreProvider>
    )
}


LogBox.ignoreLogs(['Setting a timer'])
LogBox.ignoreLogs(['AsyncStorage'])