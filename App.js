import React, { createContext } from "react"
import AppLoading from "expo-app-loading"
import { useFonts, Poppins_400Regular, Poppins_700Bold, Poppins_500Medium } from "@expo-google-fonts/poppins"

import Routes from "./src/navigation"
import { ThemeProvider } from "./src/styles/ThemeProvider"


function App() {
    let [fontsLoaded] = useFonts({
        regular: Poppins_400Regular,
        bold: Poppins_700Bold,
        medium: Poppins_500Medium
    })
    if (!fontsLoaded) {
        return <AppLoading />
    } else {
        return (
            <ThemeProvider>
                <Routes />
            </ThemeProvider>
        )
    }
}

export default App