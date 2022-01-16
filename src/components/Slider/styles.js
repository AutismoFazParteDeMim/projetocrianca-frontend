import { StyleSheet } from "react-native"

export default styles = (theme) => StyleSheet.create({
    dot: {
        width: 14,
        height: 14,
        borderRadius: 14,
        backgroundColor: theme.colors.shadow,
    },
    
    activeDot: {
        width: 18,
        height: 18,
        borderWidth: 4,
        borderRadius: 18,
        borderColor: theme.colors.primary,
        backgroundColor: theme.colors.background
    }
})