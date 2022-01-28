import { StatusBar } from 'expo-status-bar'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import AppLoading from 'expo-app-loading'
import { useFonts, Poppins_400Regular, Poppins_500Medium, Poppins_700Bold } from '@expo-google-fonts/poppins'
import { ThemeProvider } from 'styled-components/native'
import { SafeAreaProvider } from 'react-native-safe-area-context'
import { ThemeProvider as RNEThemeProvider } from 'react-native-elements'
import colorScheme from './src/theme/color-scheme'

//screens
import Home from "./src/screens/Home"
import Settings from "./src/screens/Settings"
import Games from "./src/screens/Games"
import Profile from "./src/screens/Profile"
import Activity from "./src/screens/Activity"
import Header from './src/components/Header'
import Routines from "./src/screens/Activities/Routines"
import Expressions from "./src/screens/Activities/Expressions"
import Welcome from "./src/screens/Welcome"
import Login from "./src/screens/Login"
import Register from "./src/screens/Register"


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
            <SafeAreaProvider>
                <NavigationContainer theme={theme}>
                    <ThemeProvider theme={theme}>
                        <RNEThemeProvider useDark={theme.dark} theme={theme}>
                            <StatusBar style="auto" backgroundColor={theme.colors.background} translucent={false} />
                            <Stack.Navigator
                                initialRouteName="Welcome"
                                screenOptions={{ header: props => (<Header title={props.options.title} {...props} />) }}
                            >
                                <Stack.Screen name="Home" component={Home} options={{ title: "Início", headerShown: false }} />
                                <Stack.Screen name="Settings" component={Settings} options={{ title: "Configurações" }} />
                                <Stack.Screen name="Profile" component={Profile} options={{ title: "Perfil", headerShown: false }} />
                                <Stack.Screen name="Games" component={Games} options={{ title: "Jogos" }} />
                                <Stack.Screen name="Activity" component={Activity} options={{ title: "Atividades" }} />
                                <Stack.Screen name="Routines" component={Routines} options={{ title: "Rotinas" }} />
                                <Stack.Screen name="Expressions" component={Expressions} options={{ title: "Expressões" }} />
                                <Stack.Screen name="Welcome" component={Welcome} options={{ title: "Bem-Vindo(a)!", headerShown: false }} />
                                <Stack.Screen name="Login" component={Login} options={{ title: "Login" }} />
                                <Stack.Screen name="Register" component={Register} options={{ title: "Cadastre-se" }} />
                            </Stack.Navigator>
                        </RNEThemeProvider>
                    </ThemeProvider>
                </NavigationContainer>
            </SafeAreaProvider>
        )
    }
} 