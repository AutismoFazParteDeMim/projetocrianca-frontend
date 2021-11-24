import { StyleSheet } from "react-native"
import { fonts, metrics } from "../../../styles"

const styles = (colors) => StyleSheet.create({
    container: {
        width: metrics.squareButton.width,
        height: metrics.squareButton.height,
        flexDirection: 'column',
        alignItems: "center",
        justifyContent: "center",
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.squareButton.borderBottomWidth,
        borderRadius: metrics.squareButton.borderRadius,
        borderColor: colors.primary_shadow,
        backgroundColor: colors.primary
    },

    title: {
        fontFamily: fonts.text.font,
        fontSize: fonts.text.size,
        paddingTop: fonts.text.paddingTop,
        marginLeft: metrics.padding,
        marginRight: metrics.padding,
        color: colors.text_alt_light,
    },

    image: {
        width: 64,
        height: 64,
        marginBottom: metrics.padding
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