import { StyleSheet } from "react-native"
import { global, metrics } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    container: {
        flex: 1,
    },
    titulo: {
        marginBottom: metrics.padding,
        fontFamily: "medium",
    },
    item: {
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        marginBottom: metrics.padding,
        height: metrics.button.height,
        width: "100%",
        borderRadius: metrics.button.borderRadius,
        backgroundColor: colors.inputBackground,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
    },
    itemTitle: {
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center"
    },
    iconTitle: {
        marginRight: metrics.padding,
        color: colors.text_alt_dark
    },
    sessao: {
        marginBottom: 40,
    },
    buttonLogout: {
        alignItems: "center",
    }
})

export default styles