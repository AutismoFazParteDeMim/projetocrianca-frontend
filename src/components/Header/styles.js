import { StyleSheet } from "react-native"
import { colors, metrics, global } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        width: '100%',
        height: metrics.headerHeight,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        position: "relative",
        backgroundColor: colors.background,
        zIndex: 1,
    },
    title: {
        color: colors.text
    },

    button: {
        position: "absolute",
        left: metrics.padding
    }
})

export default styles