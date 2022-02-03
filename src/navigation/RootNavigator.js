import React, { useContext, useEffect, useState } from "react"
import { View, ActivityIndicator } from "react-native"

import { auth } from "../config/firebase"
import { AuthenticatedUserContext } from "./AuthenticatedUserProvider"
import AuthStack from "./Routes/AuthStack"
import NonAuthStack from "./Routes/NonAuthStack"

export default function RootNavigator() {
    const { user, setUser } = useContext(AuthenticatedUserContext)
    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        // onAuthStateChanged returns an unsubscriber
        const unsubscribeAuth = auth.onAuthStateChanged(async authenticatedUser => {
            try {
                await (authenticatedUser ? setUser(authenticatedUser) : setUser(null))
                setIsLoading(false)
            } catch (error) {
                console.log(error)
            }
        })

        // unsubscribe auth listener on unmount
        return unsubscribeAuth
    }, [])

    if (isLoading) {
        return (
            <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
                <ActivityIndicator size="large" />
            </View>
        )
    }

    return (
        user ? <AuthStack /> : <NonAuthStack />
    )
}