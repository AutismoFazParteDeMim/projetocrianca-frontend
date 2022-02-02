import { Platform } from "react-native"

export default {
    padding: "16px",
    ...Platform.select({
        ios: { headerHeight: "120px", headerPadding: "60px" },
        android: { headerHeight: "120px", headerPadding: "40px" },
        web: { headerHeight: "100px", headerPadding: "16px" }
    }),
    button: {
        width: "240px",
        height: "56px",
        borderBottomWidth: "4px",
        borderRadius: "12px",
        iconSize: "24px"
    },
    circleButton: {
        width: "40px",
        height: "40px",
        borderBottomWidth: "4px",
        borderRadius: "40px",
        iconSize: "24px"
    },
    squareButton: {
        width: "160px",
        height: "160px",
        borderBottomWidth: "4px",
        borderRadius: "25px",
        imageSize: "64px"
    },
    input: {
        height: "56px",
        padding: "16px",
        borderRadius: "16px",
        iconSize: "24px"
    }
}