import { StyleSheet } from "react-native"
import { fonts, metrics } from "../../styles"

const styles = (colors) => StyleSheet.create({
    container: {
        width: metrics.button.width,
        height: metrics.button.height,
        alignItems: "center",
        justifyContent: "center",
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderRadius: metrics.button.borderRadius,
        marginBottom: metrics.padding,
        borderColor: colors.primary_shadow,
        backgroundColor: colors.primary
    },

    title: {
        fontFamily: fonts.button.font,
        fontSize: fonts.button.size,
        paddingTop: fonts.button.paddingTop,
        marginLeft: metrics.padding,
        marginRight: metrics.padding,
        color: colors.text_alt_light,
    },

    icon: {
        fontSize: metrics.button.iconSize,
        color: colors.text_alt_light
    },

    secondaryContainer: {
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.inputBackground
    },

    secondaryTitle: {
        color: colors.text_alt_dark
    },

    secondaryIcon: {
        color: colors.text_alt_dark
    }
})

export default styles