import { Platform } from "react-native"

export default {
    padding: 16,
    ...Platform.select({
        ios: { headerHeight: 64, headerPadding: 24 },
        android: { headerHeight: 80, headerPadding: 0 }
    }),

    button: {
        width: 240,
        height: 56,
        borderBottomWidth: 4,
        borderRadius: 12,
        iconSize: 24
    }
}