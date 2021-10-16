import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        width: "100%",
        flex: 1,
        alignItems: "center",
        justifyContent: "center"
    },

    text: {
        width: "80%",
        textAlign: "center",
        color: colors.text_alt,
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