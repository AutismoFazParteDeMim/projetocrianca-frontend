import { StyleSheet } from "react-native"
import { metrics, global } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    modal: {
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: "rgba(0,0,0,0.6)"
    },

    container: {
        width: "80%",
        height: 200,
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
    },
    icon: {
        color: colors.text_alt_light,
        fontSize: 70
    },
    text: {
        color: colors.text_alt_light,
        textAlign: "center"
    }
})

export default styles