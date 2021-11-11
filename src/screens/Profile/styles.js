import { StyleSheet } from "react-native"
import { global, colors, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,

    infos: {
        width: "100%",
        height: 60,
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        backgroundColor: colors.background
    },

    userData: {
        flexDirection: "row",
        alignItems: "center"
    },

    profilePic: {
        width: 100,
        height: 100,
        position: "absolute",
        top: -50,
        left: metrics.padding,
        borderRadius: 100
    },

    title: {
        marginLeft: 100 + metrics.padding,
    },

    icon: {
        color: colors.primary
    },

    item: {
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        marginBottom: metrics.padding,
        height: metrics.button.height,
        width: "100%",
        borderRadius: metrics.button.borderRadius,
        backgroundColor: colors.inputBackground,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
    },
    itemTitle: {
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center"
    },
    iconTitle: {
        marginRight: metrics.padding,
    },
})
export default styles