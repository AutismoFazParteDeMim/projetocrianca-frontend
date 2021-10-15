import { StyleSheet } from "react-native"

import { global, metrics, fonts } from '../../styles'

const styles = StyleSheet.create({
    ...global,
    container: {
        height: metrics.headerHeight,
        paddingTop: metrics.headerPadding,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
    },
    
    title: {
        fontSize: fonts.title.size,
        fontWeight: fonts.title.weight,
    },

    button: {
        position: "absolute",
        left: metrics.padding,
    }
})

export default styles