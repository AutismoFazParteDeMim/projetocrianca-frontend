import { StyleSheet } from "react-native"
import {global, colors, metrics} from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
    },
    titulo:{
        marginBottom: metrics.padding,
        fontFamily: "medium",
    },
    item:{
        paddingLeft: metrics.padding,
        paddingRight: metrics.padding,
        marginBottom: metrics.padding,
        height: metrics.button.height,
        width: "100%",
        borderRadius: metrics.button.borderRadius,
        backgroundColor:colors.inputBackground,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-between",
    },
    itemTitle:{
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center"
    },
    iconTitle:{
        marginRight: metrics.padding,
    },
    sessao:{
        marginBottom: 40,
    },
    buttonLogout: {
        alignItems: "center",
    }
})

export default styles