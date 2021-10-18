import { StyleSheet } from "react-native"

import colors from "./colors"
import metrics from "./metrics"
import fonts from "./fonts"

const global = StyleSheet.create({
    globalContainer: {
        width: "100%",
        flex: 1,
        padding: metrics.padding,
        backgroundColor: colors.background
    },

    globalText: {
        fontSize: fonts.text.size,
        fontWeight: fonts.text.weight,
        color: colors.text
    },

    globalTitle: {
        fontSize: fonts.title.size,
        fontWeight: fonts.title.weight,
        color: colors.text
    },

    globalIcon: {
        fontSize: 24
    }
})

export default global