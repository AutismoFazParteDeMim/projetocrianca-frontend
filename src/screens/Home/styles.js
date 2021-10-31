import { StyleSheet } from "react-native"
import { colors, global, metrics, fonts } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container:{
        flex:1,
        justifyContent: 'center',
        alignItems: 'center',
        width: "100%",
        height: metrics.button.height,
        marginBottom: metrics.padding
    },
    headerHome: {
        flex: 0,
        flexDirection: 'row',
    },
    iconPerson: {
        width: "30%",
        fontSize: 50,
        height: metrics.button.height,
        marginBottom: metrics.padding,
    },
    containerInputSearch:{
        width: "70%",
        height: metrics.button.height,
        marginBottom: metrics.padding,
        alignItems: 'flex-end',
    },
    wrapper: {
        width: "100%",
        height: "100%",
        paddingRight: metrics.padding,
        flexDirection: "row",
        borderRadius: metrics.button.borderRadius,
        borderWidth: 5,
        borderColor: colors.primary,
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
        fontSize: metrics.button.iconSize,
        color: colors.text
    },
    input: {
        flex: 1,
        fontFamily: fonts.text.font,
        fontSize: fonts.text.size,
        paddingTop: fonts.text.paddingTop
    },

    welcome:{
        marginTop: 26
    },
    titleHome:{
        fontSize: fonts.subTitle.size,
        fontWeight: 'bold',
    },
})

export default styles