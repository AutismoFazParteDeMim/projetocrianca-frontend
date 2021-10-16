import { StyleSheet } from "react-native"
import {colors, fonts, metrics} from "../../styles"

const styles = StyleSheet.create({
    text: {
        fontSize: fonts.text.size,
        fontWeight: fonts.button.weight,
        textDecorationLine: "underline",
        color: colors.primary
    }
})

export default styles