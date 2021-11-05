import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },

    input: {
        marginBottom: metrics.padding
    },

    image: {
        height: "40%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    }
})

export default styles