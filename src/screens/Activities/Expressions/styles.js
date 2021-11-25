import { StyleSheet } from "react-native"
import { colors, global, metrics, fonts } from "../../../styles"

const styles = StyleSheet.create({
    ...global(colors),
    image: {
        height: '40%',
        width: '100%',
        resizeMode: 'contain',
        marginBottom: metrics.padding
    },
    botaoPaginacao: {
        backgroundColor: colors.text,
        height: 25,
        width: 25,
        borderRadius: 20
    },
    descricao: {
        textAlign: 'center',
        marginTop: 75,
    },
    icon: {
        fontSize: 45,
        color: colors.text,
    }
})

export default styles