import { StyleSheet } from "react-native"
import ModalStyle from "../styles"

const styles = (colors) => StyleSheet.create({
    ...ModalStyle(colors),
    container_alt: {
        borderColor: colors.danger_shadow,
        backgroundColor: colors.danger,
    },


})

export default styles