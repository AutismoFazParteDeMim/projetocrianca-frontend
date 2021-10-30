import { StyleSheet } from "react-native"
import { colors, global, metrics } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },

    animals: {
        height: "40%",
        resizeMode: 'contain',
        marginBottom: metrics.padding
    },
<<<<<<< HEAD
    link: {
=======
    link:{
        padding: 15,
>>>>>>> main
        width: "100%",
        flexDirection: "row-reverse",
        // justifyContent: "flex-end",
        flexWrap: "wrap",
    }
})

export default styles