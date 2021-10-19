import { Inter_100Thin } from "@expo-google-fonts/inter"
import { StyleSheet } from "react-native"
import { colors, metrics, global } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    modal: {
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: "rgba(0,0,0,0.6)"
    },

    container: {
        width: "100%",
        height: 400,
        padding: metrics.padding,
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderRadius: metrics.button.borderRadius,
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.background,
    },

    content: {
        flex: 1,
        alignItems: "center",
        justifyContent: "space-evenly"
    }
})

export default styles