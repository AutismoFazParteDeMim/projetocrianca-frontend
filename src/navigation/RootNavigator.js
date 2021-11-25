import React, { useContext, useEffect, useState } from "react"
import { NavigationContainer } from "@react-navigation/native"
import { View, ActivityIndicator } from "react-native"
import { StatusBar } from "react-native"

import { auth, firestore } from "../config/firebase"
import { AuthenticatedUserContext } from "./AuthenticatedUserProvider"
import AuthStack from "./routes/AuthStack"
import NoAuthStack from "./routes/NoAuthStack"

import { ThemeContext } from "../styles/ThemeProvider"

function RootNavigator() {
    const { user, setUser, setChild } = useContext(AuthenticatedUserContext)
    const [isLoading, setIsLoading] = useState(true)
    const { colors, theme } = useContext(ThemeContext)

    useEffect(() => {
        const unsubscribeAuth = auth.onAuthStateChanged(authenticatedUser => {
            try {
                if (authenticatedUser) {
                    setUser(authenticatedUser)
                    let docRef = firestore.collection("users").doc(authenticatedUser.uid);
                    docRef.get().then((doc) => {
                        if (doc.exists) {
                            setChild(doc.data())
                        } else {
                            console.log("No such document!");
                            setChild(null)
                        }
                    }).catch((error) => {
                        console.log(error)
                    })
                } else {
                    setUser(null)
                    setChild(null)
                }
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