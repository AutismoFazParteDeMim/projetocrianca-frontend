import { StyleSheet } from "react-native"
import { global, metrics } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center"
    },

    animals: {
        height: "40%",
        resizeMode: 'contain'
    },

    input: {
        marginBottom: metrics.padding
    },

    link: {
        width: "100%",
        flexDirection: "row-reverse",
        marginBottom: metrics.padding
    }
})

export default styles