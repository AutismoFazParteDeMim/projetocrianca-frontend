import { StyleSheet } from "react-native"
import { global, colors } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 6,
    },
    titulo1:{
        position: "absolute",
        width: 366,
        height: 158,
        left: 24,
        top: 132,
        fontSize: 12
    },
    conteudoInterface1:{
        position: "absolute",
        width: 366,
        height: 56,
        left: 10,
        top: 162,
        borderRadius: 12,
        backgroundColor:"#E5E5E5",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-around",
    },
    conteudoInterface2:{
        position: "absolute",
        width: 366,
        height: 56,
        left: 10,
        top: 234,
        borderRadius: 12,
        backgroundColor:"#E5E5E5",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-around",
    },
    titulo2:{
        position: "absolute",
        width: 366,
        height: 158,
        left: 24,
        top: 334
    },
    conteudoAplicativo:{
        position: "absolute",
        width: 366,
        height: 56,
        left: 10,
        top: 364,
        borderRadius: 12,
        backgroundColor:"#E5E5E5",
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "space-around",
    },
    bottomSide: {
        flex: 15,
        alignItems: "center",
        justifyContent: "center",

    }
})

export default styles