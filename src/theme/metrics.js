import { Platform } from "react-native"

export default {
    padding: "16px",
    ...Platform.select({
        ios: { headerHeight: "100px", headerPadding: "32px" },
        android: { headerHeight: "100px", headerPadding: "0px" },
        web: { headerHeight: "100px", headerPadding: "0px" }
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