import React, { useContext, useEffect, useState } from "react"
import { View, ActivityIndicator } from "react-native"

import { auth } from "../config/firebase"
import { AuthenticatedUserContext } from "./AuthenticatedUserProvider"
import AuthStack from "./Routes/AuthStack"
import NonAuthStack from "./Routes/NonAuthStack"

import { onAuthStateChanged } from "firebase/auth"
import { firestore } from "../config/firebase"
import { doc, getDoc } from "firebase/firestore"

export default function RootNavigator() {
    const { user, setUser, setChild } = useContext(AuthenticatedUserContext)
    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        // onAuthStateChanged returns an unsubscriber
        let unsubscribeAuth = onAuthStateChanged(auth, async authenticatedUser => {
            try {
                if (authenticatedUser) {
                    let docRef = doc(firestore, "users", authenticatedUser.uid);
                    let docSnap = await getDoc(docRef);

                    if (docSnap.exists) {
                        await setChild(docSnap.data())
                        await setUser(authenticatedUser)
                    } else {
                        // doc.data() will be undefined in this case
                        console.log("No such document!");
                    }
                } else {
                    setUser(null)
                    setChild(null)
                }

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