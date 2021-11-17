import { StyleSheet } from "react-native"
import { colors, fonts, metrics } from "../../../styles"

const styles = StyleSheet.create({
    container: {
        width: metrics.rebutton.width*1.5,
        height: metrics.rebutton.height*1.2,
        alignItems: "flex-start",
        justifyContent: "center",
        borderLeftWidth: 0.1,
        borderRightWidth: 0.1,
        borderBottomWidth: metrics.button.borderBottomWidth,
        borderRadius: metrics.button.borderRadius,
        marginBottom: metrics.padding,
        borderColor: colors.third_shadow,
        backgroundColor: colors.third
    },

    title: {
        fontFamily: fonts.rebutton.font,
        fontSize: fonts.rebutton.size,
        paddingTop: fonts.rebutton.paddingTop,
        marginLeft: metrics.padding,
        marginRight: metrics.padding,
        color: colors.text
    },

    subtitle: {
        fontFamily: fonts.rebutton.font,
        fontSize: 0.5*fonts.rebutton.size,
        paddingTop: fonts.rebutton.paddingTop,
        marginLeft: metrics.padding,
        marginRight: metrics.padding,
        color: colors.text
    },

    Container: {
        borderColor: colors.inputBackground_shadow,
        backgroundColor: colors.inputBackground
    },

    Title: {
        color: colors.text
    },

    Icon: {
        color: colors.text
    },

    icon: {
        fontSize: metrics.button.iconSize,
        color: colors.text
    },

    buttonseparator: {
        backgroundColor: '#fff', 
        width: 1, 
        height: 40,
    },

    imagem: {
        height: "40%",
        resizeMode: 'stretch',
        marginBottom: metrics.padding
    }
})

export default styles