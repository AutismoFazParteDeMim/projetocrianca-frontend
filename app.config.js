import "dotenv/config"

export default {
    expo: {
        name: "ProjetoCrianca",
        slug: "ProjetoCrianca",
        version: "1.0.0",
        orientation: "portrait",
        userInterfaceStyle: "automatic",
        icon: "./assets/icon.png",
        splash: {
            image: "./assets/splash.png",
            resizeMode: "contain",
            backgroundColor: "#ffffff"
        },
        updates: {
            fallbackToCacheTimeout: 0
        },
        assetBundlePatterns: [
            "**/*"
        ],
        ios: {
            supportsTablet: true,
            userInterfaceStyle: "automatic"
        },
        android: {
            package: "com.unisociesc.projetocrianca",
            adaptiveIcon: {
                foregroundImage: "./assets/adaptive-icon.png",
                backgroundColor: "#FFFFFF"
            },
            userInterfaceStyle: "automatic",
            googleServicesFile: "./google-services.json",
            config: {
                googleSignIn: {
                    certificateHash: "5116f74fcfb4e57ef7e5ab243a875b8a4597c0c7"
                }
            }
        },
        web: {
            favicon: "./assets/favicon.png"
        },
        plugins: ["@react-native-google-signin/google-signin"],   
        extra: {
            apiKey: process.env.API_KEY,
            authDomain: process.env.AUTH_DOMAIN,
            databaseURL: process.env.DATABASE_URL,
            projectId: process.env.PROJECT_ID,
            storageBucket: process.env.STORAGE_BUCKET,
            messagingSenderId: process.env.MESSAGING_SENDER_ID,
            appId: process.env.APP_ID,
            measurementId: process.env.MEASUREMENT_ID
        }
    }
}