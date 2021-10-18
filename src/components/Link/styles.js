import { StyleSheet } from "react-native"
import { colors, fonts } from "../../styles"

const styles = StyleSheet.create({
    text: {
        fontFamily: fonts.button.font,
        fontSize: fonts.text.size,
        paddingTop: fonts.text.paddingTop,
        textDecorationLine: "underline",
        color: colors.primary
    }
})

export default styles