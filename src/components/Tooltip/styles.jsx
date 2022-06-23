import { StyleSheet } from "react-native"
import { Platform } from "react-native"

export const classicStyles = (theme) => StyleSheet.create({
    tooltipContainer: {
        width: 145,
        height: 130,
    },
    popoverText: {
        color: Platform.OS === "web" ? "#3D3D3D" : theme.colors.text,
    }
})