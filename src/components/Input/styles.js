import { StyleSheet } from "react-native"
import { global, metrics, fonts } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    container: {
        width: "100%",
        height: metrics.button.height,
    },

    wrapper: {
        width: "100%",
        height: "100%",
        paddingRight: metrics.padding,
        flexDirection: "row",
        borderRadius: metrics.button.borderRadius,
        backgroundColor: colors.inputBackground,
    },

    iconWrapper: {
        height: "100%",
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        alignItems: "center",
        justifyContent: "center",
        borderRadius: metrics.button.borderRadius,
        //marginRight: metrics.padding,
        //backgroundColor: colors.inputBackground_shadow,
        color: colors.text_alt_dark
    },

    icon: {
        fontSize: metrics.button.iconSize,
        color: colors.text_alt_dark
    },

    input: {
        flex: 1,
        fontFamily: fonts.text.font,
        fontSize: fonts.text.size,
        paddingTop: fonts.text.paddingTop
    }
})

export default styles