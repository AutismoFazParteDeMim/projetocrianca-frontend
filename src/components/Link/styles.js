import { StyleSheet } from "react-native"
import { fonts } from "../../styles"

const styles = (colors) => StyleSheet.create({
    text: {
        fontFamily: fonts.button.font,
        fontSize: fonts.text.size,
        paddingTop: fonts.text.paddingTop,
        textDecorationLine: "underline",
        color: colors.primary
    }
})

export default styles