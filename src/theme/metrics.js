import { Platform } from "react-native"

export default {
    padding: "16px",
    ...Platform.select({
        ios: { headerHeight: "100px", headerPadding: "32px" },
        android: { headerHeight: "100px", headerPadding: "0px" },
        web: { headerHeight: "100px", headerPadding: "0px" }
    }),
    button: {
        width: 240,
        height: 56,
        borderBottomWidth: 4,
        borderRadius: 12,
        iconSize: 24
    },
    circleButton: {
        width: "40px",
        height: "40px",
        borderBottomWidth: "4px",
        borderRadius: "40px",
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