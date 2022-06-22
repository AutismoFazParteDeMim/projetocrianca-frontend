import { useEffect, useState } from "react"
import { View, ActivityIndicator } from "react-native"

import { auth } from "../config/firebase"
import AuthStack from "./Routes/AuthStack"
import NonAuthStack from "./Routes/NonAuthStack"

import { onAuthStateChanged } from "firebase/auth"
import { firestore } from "../config/firebase"
import { doc, onSnapshot } from "firebase/firestore"

import { useDispatch, useSelector } from "react-redux"
import { reset } from "../redux/modules/settings/actions"
import { setUserAction, setChildAction, resetAction } from "../redux/modules/user/actions"

export default function RootNavigator() {
    const dispatch = useDispatch()
    const { user } = useSelector((state) => state.user)
    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        let unsubscribeAuth = onAuthStateChanged(auth, async authenticatedUser => {
            try {
                if (authenticatedUser) {
                    let docRef = doc(firestore, "users", authenticatedUser.uid);
                    onSnapshot(docRef, (doc) => {
                        if (doc.exists) {
                            dispatch(setUserAction({ logged: true, ...authenticatedUser }))
                            dispatch(setChildAction(doc.data()))
                        } else {
                            console.log("No such document!");
                        }
                    });
                } else {
                    dispatch(reset())
                    dispatch(resetAction())
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
            <View style={{ flex: 1, justifyContent: "center", alignItems: "center" }}>
                <ActivityIndicator size="large" />
            </View>
        )
    }

    return (
        user.logged ? <AuthStack /> : <NonAuthStack />
    )
}