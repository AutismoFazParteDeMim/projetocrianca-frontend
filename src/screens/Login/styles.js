import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },

    animals:{
        flex: 1,
        width: 266,
        heigth: 256, 
        marginBottom: 16,
        marginTop: 464,  
    },
})

export default styles