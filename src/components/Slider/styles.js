import { StyleSheet } from "react-native"
import { global } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
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