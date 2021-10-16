import { StyleSheet } from "react-native"
import {colors, metrics} from "../../../styles"

const styles = StyleSheet.create({
    container: {
        width: 40,
        height: 40,
        alignItems: "center",
        justifyContent: "center",
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.button.borderBottomWidth,
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