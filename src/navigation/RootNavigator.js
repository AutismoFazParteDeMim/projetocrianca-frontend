import React, { useContext, useEffect, useState } from "react"
import { NavigationContainer } from "@react-navigation/native"
import { View, ActivityIndicator } from "react-native"
import { StatusBar } from "react-native"

import { auth } from "../config/firebase"
import { AuthenticatedUserContext } from "./AuthenticatedUserProvider"
import AuthStack from "./routes/AuthStack"
import NoAuthStack from "./routes/NoAuthStack"

import { ThemeContext } from "../styles/ThemeProvider"

function RootNavigator() {
    const { user, setUser } = useContext(AuthenticatedUserContext)
    const [isLoading, setIsLoading] = useState(true)
    const { colors, theme } = useContext(ThemeContext)

    useEffect(() => {
        const unsubscribeAuth = auth.onAuthStateChanged(async authenticatedUser => {
            try {
                await (authenticatedUser ? setUser(authenticatedUser) : setUser(null))
                setIsLoading(false)
            } catch (error) {
                console.log(error)
            }
        })

        return unsubscribeAuth
    }, [])

    if (isLoading) {
        return (
            <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
                <ActivityIndicator size='large' />
            </View>
        )
    }

    return (
        <NavigationContainer theme={{ colors }}>
            <StatusBar
                animated={true}
                backgroundColor={colors.background}
                barStyle={theme === "light" ? "dark-content" : "light-content"}
                translucent={false}
                hidden={false} />

            {user ? <AuthStack /> : <NoAuthStack />}
        </NavigationContainer>

    )
}

export default RootNavigator