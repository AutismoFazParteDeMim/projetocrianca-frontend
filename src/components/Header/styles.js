import { StyleSheet } from "react-native"
import { colors, fonts, metrics } from "../../styles"

const styles = StyleSheet.create({
    container: {
        width: '100%',
        height: metrics.headerHeight,
        padding: metrics.headerPadding,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center"
    },

    title: {
        fontSize: fonts.title.size,
        fontWeight: fonts.title.weight,
        color: colors.text
    },

    button: {
        position: "absolute",
        left: metrics.padding
    }
})

export default styles