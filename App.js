import React from "react"
import AppLoading from "expo-app-loading"
import { useFonts, Poppins_400Regular, Poppins_700Bold } from "@expo-google-fonts/poppins"

import Routes from "./src/routes"

function App() {
    let [fontsLoaded] = useFonts({
        regular: Poppins_400Regular,
        bold: Poppins_700Bold
    })
    if (!fontsLoaded) {
        return <AppLoading />
    } else {
        return (
            <Routes />
        )
    }
}

export default App