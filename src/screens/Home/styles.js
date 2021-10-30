import { StyleSheet } from "react-native"
import { colors, global, metrics, fonts } from "../../styles"

const styles = StyleSheet.create({
    ...global,
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },
    headerHomeText: {
        fontSize: 20,
        fontWeight:'bold',
        color: colors.text
    }
})

export default styles