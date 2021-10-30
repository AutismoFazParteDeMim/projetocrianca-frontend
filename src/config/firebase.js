import fireBase from 'firebase'
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

let firebase

if (fireBase.apps.length === 0) {
    firebase = fireBase.initializeApp(firebaseConfig);
}

export default firebase