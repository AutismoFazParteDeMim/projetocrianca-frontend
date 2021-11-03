import { StyleSheet } from "react-native"
import { colors, fonts, metrics } from "../../styles"

const styles = StyleSheet.create({
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
        borderColor: colors.danger_shadow,
        backgroundColor: colors.danger
    },

    title: {
        fontFamily: fonts.button.font,
        fontSize: fonts.button.size,
        paddingTop: fonts.button.paddingTop,
        marginLeft: metrics.padding,
        marginRight: metrics.padding,
        color: colors.text_alt,
    },

    icon: {
        fontSize: metrics.button.iconSize,
        color: colors.text_alt
    },

    secondaryContainer: {
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.inputBackground
    },

    secondaryTitle: {
        color: colors.text
    },

    secondaryIcon: {
        color: colors.text
    }
})

export default styles