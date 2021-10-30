import { StyleSheet } from "react-native"
import { global, metrics } from "../../styles"

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
        paddingBottom: metrics.padding,
        width: "100%",
        flexDirection: "row-reverse",
        flexWrap: "wrap",
    }
})

export default styles