import { Platform } from "react-native"

export default {
    padding: 16,
    ...Platform.select({
        ios: { headerHeight: 120, headerPadding: 60 },
        android: { headerHeight: 120, headerPadding: 40 },
        web: { headerHeight: 100, headerPadding: 16 }
    }),
    button: {
        width: 240,
        height: 56,
        borderBottomWidth: 4,
        borderRadius: 12,
        iconSize: 24
    },
    circleButton: {
        width: 40,
        height: 40,
        borderBottomWidth: 4,
        borderRadius: 40,
        iconSize: 24
    },
    squareButton: {
        width: 160,
        height: 160,
        borderBottomWidth: 4,
        borderRadius: 24,
        imageSize: 64
    },
    input: {
        height: 56,
        padding: 16,
        borderRadius: 16,
        iconSize: 24
    }
}