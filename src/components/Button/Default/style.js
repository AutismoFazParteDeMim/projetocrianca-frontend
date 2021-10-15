import { StyleSheet } from "react-native";

import {colors, fonts, metrics} from "../../../styles"

const styles = StyleSheet.create({
    container: {
        width: metrics.button.width,
        height: metrics.button.height,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderRadius: metrics.button.borderRadius,
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.inputBackground,
    },

    text: {
        fontSize: fonts.button.size,
        fontWeight: fonts.button.weight,
        color: colors.text
    },

    icon: {
        fontSize: metrics.button.iconSize,
        marginEnd: metrics.padding,
        color: colors.text
    },

    containerPrimary: {
        borderColor: colors.primary_shadow,
        backgroundColor: colors.primary,
    },

    textPrimary: {
        color: colors.text_alt
    },

    iconPrimary: {
        color: colors.text_alt
    }
})

export default styles