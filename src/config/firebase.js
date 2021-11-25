import firebase from 'firebase'
import "firebase/auth"
import "@firebase/firestore"
import Constants from 'expo-constants'

// Initialize Firebase
const firebaseConfig = {
    apiKey: Constants.manifest.extra.apiKey,
    authDomain: Constants.manifest.extra.authDomain,
    projectId: Constants.manifest.extra.projectId,
    storageBucket: Constants.manifest.extra.storageBucket,
    messagingSenderId: Constants.manifest.extra.messagingSenderId,
    appId: Constants.manifest.extra.appId,
    measurementId: Constants.manifest.extra.measurementId
}

firebase.initializeApp(firebaseConfig)

const firestore = firebase.firestore()
const auth = firebase.auth()

export { firebase, firestore, auth }