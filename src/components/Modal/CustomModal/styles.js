import { StyleSheet } from "react-native"
import { colors } from "../../../styles"
import ModalStyle from "../styles"

const styles = StyleSheet.create({
    ...ModalStyle,
    modal_alt: {
        backgroundColor: "rgba(0,0,0,0.6)",
    },

    container_alt: {
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.background,
    }
})

export default styles