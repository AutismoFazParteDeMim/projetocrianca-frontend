import { StyleSheet } from "react-native"
import { colors } from "../../../styles"
import ModalStyle from "../styles"

const styles = StyleSheet.create({
    ...ModalStyle,

    container_alt: {
        borderColor: colors.success_shadow,
        backgroundColor: colors.success,
    },
   
  
})

export default styles