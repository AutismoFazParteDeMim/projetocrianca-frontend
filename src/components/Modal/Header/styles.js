import { StyleSheet } from "react-native"
import { fonts, global, metrics } from "../../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        width: "100%",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        marginBottom: metrics.padding
    },

    title: {
        fontSize: fonts.subTitle.size
    },

    button: {
        position: "absolute",
        right: 0
    }
})

export default styles