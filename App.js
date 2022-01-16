import { StatusBar } from 'expo-status-bar'
import { StyleSheet, Text, View } from 'react-native'
import AppLoading from 'expo-app-loading';
import { useFonts, Poppins_400Regular, Poppins_500Medium, Poppins_700Bold } from '@expo-google-fonts/poppins'

export default function App() {
    let [fontsLoaded] = useFonts({
        "regular": Poppins_400Regular,
        "medium": Poppins_500Medium,
        "bold": Poppins_700Bold
    })

    if (!fontsLoaded) {
        return <AppLoading />
    } else {
        return (
            <View style={{ flex: 1 }}>
                <Text style={{ fontFamily: "bold" }}>Open up App.js to start working on your app!</Text>
                <Text>Open up App.js to start working on your app!</Text>
                <StatusBar style="auto" />
            </View>
        )
    }
}