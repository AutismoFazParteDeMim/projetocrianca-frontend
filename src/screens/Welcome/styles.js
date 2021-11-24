import { StyleSheet } from "react-native"
import { global, metrics } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: colors.background
    },

    text: {
        width: "80%",
        textAlign: "center",
        color: colors.text_alt_light
    },

    title: {
        marginBottom: metrics.padding
    },

    topSide: {
        width: "100%",
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: colors.primary
    },

    bottomSide: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    }
})

export default styles