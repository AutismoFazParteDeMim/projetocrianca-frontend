import { StyleSheet } from "react-native"

import metrics from "./metrics"
import fonts from "./fonts"

const global = (colors) => StyleSheet.create({
    globalContainer: {
        width: "100%",
        flex: 1,
        padding: metrics.padding,
        backgroundColor: colors.background
    },

    globalSliderContainer: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: colors.background
    },

    globalText: {
        fontFamily: fonts.text.font,
        fontSize: fonts.text.size,
        color: colors.text,
        paddingTop: fonts.text.paddingTop
    },

    globalTitle: {
        fontFamily: fonts.title.font,
        fontSize: fonts.title.size,
        paddingTop: fonts.title.paddingTop,
        color: colors.text
    },

    globalSubtitle: {
        fontFamily: fonts.subTitle.font,
        fontSize: fonts.subTitle.size,
        paddingTop: fonts.subTitle.paddingTop,
        color: colors.text,
    },

    globalIcon: {
        fontSize: 24,
    }
})

export default global