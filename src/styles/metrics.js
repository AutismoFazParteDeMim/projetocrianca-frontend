import { Platform } from "react-native"

export default {
    padding: 16,
    ...Platform.select({
        ios: { headerHeight: 100, headerPadding: 32 },
        android: { headerHeight: 80, headerPadding: 0 }
    }),
    button: {
        width: 240,
        height: 56,
        borderBottomWidth: 4,
        borderRadius: 12,
        iconSize: 24
    },
    squareButton: {
        width: 160,
        height: 160,
        borderBottomWidth: 4,
        borderRadius: 25,
        imageSize: 64
    }
}