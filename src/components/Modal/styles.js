import { StyleSheet } from "react-native"
import { metrics, global } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    modal: {
        alignItems: "center",
        justifyContent: "center"
    },

    container: {
        width: "100%",
        height: 400,
        padding: metrics.padding,
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderRadius: metrics.button.borderRadius,
    },

    content: {
        flex: 1,
        alignItems: "center",
        justifyContent: "space-evenly"
    }
})

export default styles