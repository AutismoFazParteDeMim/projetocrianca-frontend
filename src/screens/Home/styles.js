import { StyleSheet } from "react-native"
import { colors, global, metrics, fonts } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        width: "100%",
    },
    headerHome: {
        width: '100%',
        height: metrics.headerHeight,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
        backgroundColor: colors.background,
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,

    },
    iconPerson: {
        width: 50,
        height: 50,
        borderRadius: 50,
    },
    containerInputSearch: {
        width: "60%",
        alignItems: 'center',
    },

    titleHome: {
        fontSize: fonts.subTitle.size,
        fontWeight: 'bold',
    },
    welcome: {
        fontSize: fonts.subTitle.size,
        fontWeight: fonts.subTitle.font,

    },
    grid: {
        width: "100%",
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-evenly',
        marginBottom: metrics.padding



    }
})

export default styles