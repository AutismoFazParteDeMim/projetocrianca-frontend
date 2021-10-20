import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },

    abc:{
        height: "60%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    },
    rotina: {
        height: "60%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    },
    expressao: {
        height: "60%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    }
})

export default styles