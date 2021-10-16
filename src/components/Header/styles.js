import { StyleSheet } from "react-native"
import { colors, fonts, metrics } from "../../styles"

const styles = StyleSheet.create({
    container: {
        width: '100%',
        height: metrics.headerHeight,
        paddingTop: metrics.headerPadding,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        position: "relative",
        backgroundColor: colors.background
    },

    title: {
        fontSize: fonts.title.size,
        fontWeight: fonts.title.weight,
        color: colors.text
    },

    button: {
        position: "absolute",
        left: 0
    }
})

export default styles