import { StyleSheet } from "react-native"
import {global, colors, metrics} from "../../styles"

const styles = StyleSheet.create({
...global,
    container: {
        flex: 1,
    },
    itemTitle:{
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "flex-start",
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

    iconProfile:{
        fontSize: 150,
        color: colors.primary,
    },
    iconTitle:{
        fontSize: 30,
        color: colors.primary,
    },
    icons:{
        marginRight: metrics.padding,
    },
    button: {
        position: "absolute",
        left: 0
    }
})
export default styles