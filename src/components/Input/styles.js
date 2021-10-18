import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container:{
        width: "100%",
        height: metrics.button.height,
        marginBottom: metrics.padding
    },

    wrapper: {
        width: "100%",
        height: "100%",
        paddingRight: metrics.padding,
        flexDirection: "row",
        borderRadius: metrics.button.borderRadius,
        backgroundColor: colors.inputBackground
    },

    iconWrapper: {
        height: "100%",
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        alignItems: "center",
        justifyContent: "center",
        borderRadius: metrics.button.borderRadius,
        //marginRight: metrics.padding,
        //backgroundColor: colors.inputBackground_shadow,
        color: colors.text_alt
    },

    icon: {
        color: colors.text,
    },

    input: {
        flex: 1
    }
})

export default styles