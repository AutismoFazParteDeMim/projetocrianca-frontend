import { StatusBar } from 'expo-status-bar'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import AppLoading from 'expo-app-loading'
import { useFonts, Poppins_400Regular, Poppins_500Medium, Poppins_700Bold } from '@expo-google-fonts/poppins'

import Home from "./src/screens/Home"
import Settings from "./src/screens/Settings"
import Games from "./src/screens/Games"
import Profile from "./src/screens/Profile"
import Activities from "./src/screens/Activities"
import colorScheme from './src/theme/color-scheme'
import { ThemeProvider } from 'styled-components/native'
import Header from './src/components/Header'


const Stack = createNativeStackNavigator()
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
            <NavigationContainer theme={theme}>
                <ThemeProvider theme={theme}>
                    <StatusBar style="light" backgroundColor={theme.colors.background} translucent={false} />
                    <Stack.Navigator
                        initialRouteName="Home"
                        screenOptions={{ header: props => (<Header title={props.options.title} />) }}
                    >
                        <Stack.Screen name="Home" component={Home} options={{ title: "Início", headerShown: false }} />
                        <Stack.Screen name="Settings" component={Settings} options={{ title: "Configurações" }} />
                        <Stack.Screen name="Profile" component={Profile} options={{ title: "Perfil" }} />
                        <Stack.Screen name="Games" component={Games} options={{ title: "Jogos" }} />
                        <Stack.Screen name="Activities" component={Activities} options={{ title: "Atividades" }} />
                    </Stack.Navigator>
                </ThemeProvider>
            </NavigationContainer>
        )
    }
} 