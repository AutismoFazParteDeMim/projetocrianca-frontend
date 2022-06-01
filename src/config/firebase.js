import { initializeApp } from "firebase/app"
import { getAuth } from "firebase/auth"
import { getFirestore, initializeFirestore } from "firebase/firestore"

import Constants from "expo-constants"

// Initialize Firebase
const firebaseConfig = {
    apiKey: Constants.manifest.extra.apiKey,
    authDomain: Constants.manifest.extra.authDomain,
    databaseURL: Constants.manifest.extra.databaseURL,
    projectId: Constants.manifest.extra.projectId,
    storageBucket: Constants.manifest.extra.storageBucket,
    messagingSenderId: Constants.manifest.extra.messagingSenderId,
    appId: Constants.manifest.extra.appId,
    measurementId: Constants.manifest.extra.measurementId
}

const firebase = initializeApp(firebaseConfig)
const firestore = initializeFirestore(firebase, {
    experimentalForceLongPolling: true,
    useFetchStreams: false,
})

const auth = getAuth()

export { firebase, firestore, auth }