import { StyleSheet } from "react-native"
import { global, metrics } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
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