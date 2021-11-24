import { StyleSheet } from "react-native"
import { fonts, global, metrics } from "../../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    container: {
        width: "100%",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        marginBottom: metrics.padding
    },

    title: {
        fontSize: fonts.subTitle.size,
        color: colors.text_alt_light
    },

    button: {
        position: "absolute",
        right: 0
    }
})

export default styles