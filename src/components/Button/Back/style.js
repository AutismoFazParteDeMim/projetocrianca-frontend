import { StyleSheet } from "react-native";

import {colors, metrics} from "../../../styles"

const styles = StyleSheet.create({
    container: {
        width: 40,
        height: 40,
        alignItems: "center",
        justifyContent: "center",
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderRadius: 40,
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.inputBackground
    },

    icon: {
        fontSize: metrics.button.iconSize,
        color: colors.text
    }
})

export default styles