import { StyleSheet } from "react-native"
import ModalStyle from "../styles"

const styles = (colors) => StyleSheet.create({
    ...ModalStyle(colors),
    container_alt: {
        borderColor: colors.success_shadow,
        backgroundColor: colors.success,
    },
   
  
})

export default styles