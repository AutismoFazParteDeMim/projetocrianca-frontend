import { StyleSheet } from "react-native"
import { global, metrics, fonts } from "../../styles"

const styles = (colors) => StyleSheet.create({
    ...global(colors),
    item: {
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        marginBottom: metrics.padding,
        height: metrics.button.height,
        width: "100%",
        height: 140,
        borderRadius: 1.5 * metrics.button.borderRadius,
        backgroundColor: colors.inputBackground,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
    },

    itemImage: {
        width: 60,
        height: 60
    },

    itemText: {
        width: "64%"
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
})

export default styles