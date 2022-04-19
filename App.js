import React from 'react'
import { useFonts, Poppins_400Regular, Poppins_500Medium, Poppins_700Bold } from '@expo-google-fonts/poppins'
import AppLoading from 'expo-app-loading'
import { NavigationContainer } from "@react-navigation/native"
import { ThemeProvider } from 'styled-components/native'
import { ThemeProvider as RNEThemeProvider } from 'react-native-elements'
import { StatusBar } from "expo-status-bar"

import colorScheme from './src/theme/color-scheme'
import Routes from "./src/navigation"

import { Provider as StoreProvider } from 'react-redux'
import store from './src/redux'

export default function App() {
    const theme = colorScheme()

    let [fontsLoaded] = useFonts({
        "regular": Poppins_400Regular,
        "medium": Poppins_500Medium,
        "bold": Poppins_700Bold
    })

    if (!fontsLoaded) {
        return <AppLoading />
    } else {
        return (
            <StoreProvider store={store}>
                <NavigationContainer theme={theme}>
                    <ThemeProvider theme={theme}>
                        <RNEThemeProvider useDark={theme.dark} theme={theme}>
                            <StatusBar style="auto" />
                            <Routes />
                        </RNEThemeProvider>
                    </ThemeProvider>
                </NavigationContainer>
            </StoreProvider>
        )
    }
} 