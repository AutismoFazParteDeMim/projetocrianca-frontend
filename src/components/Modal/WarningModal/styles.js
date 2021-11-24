import { StyleSheet } from "react-native"
import ModalStyle from "../styles"

const styles = (colors) => StyleSheet.create({
    ...ModalStyle(colors),
    container_alt: {
        borderColor: colors.warning_shadow,
        backgroundColor: colors.warning,
    },
   
  
})

export default styles