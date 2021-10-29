import { StyleSheet } from "react-native"
import { colors } from "../../../styles"
import ModalStyle from "../styles"

const styles = StyleSheet.create({
    ...ModalStyle,

    container_alt: {
        borderColor: colors.warning_shadow,
        backgroundColor: colors.warning,
    },
   
  
})

export default styles