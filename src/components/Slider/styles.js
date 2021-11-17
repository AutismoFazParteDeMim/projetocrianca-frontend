import { StyleSheet } from "react-native"
import { colors, global, metrics, fonts } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    dot: {
        width: 18,
        height: 18,
        borderRadius: 20,
        backgroundColor: colors.shadow,
    },

    activeDot: {
        backgroundColor: colors.background,
        height: 20,
        width: 20,
        borderWidth: 4,
        borderColor: colors.text,
        borderRadius: 20
    }
})

export default styles