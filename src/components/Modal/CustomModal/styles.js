import { StyleSheet } from "react-native"
import { colors } from "../../../styles"
import ModalStyle from "../styles"

const styles = (colors) => StyleSheet.create({
    ...ModalStyle(colors),
    modal_alt: {
        backgroundColor: "rgba(0,0,0,0.6)",
    },

    container_alt: {
        width: "100%",
        height: 400,
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.background,
    }
})

export default styles