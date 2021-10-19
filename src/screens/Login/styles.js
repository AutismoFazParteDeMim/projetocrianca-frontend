import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },

    animals: {
        height: "40%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    },
    link:{
        width: "100%",
        flexDirection: "row-reverse",
        // justifyContent: "fle-end",
        flexWrap: "wrap",
    }
})

export default styles