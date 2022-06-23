import { Tooltip as RNETooltip } from 'react-native-elements'
import { useTheme } from 'styled-components/native'
import Text from "../Text"
import { Platform } from "react-native"

import { classicStyles } from "./styles"

export default function Tooltip({ children, text }) {
    const theme = useTheme()

    return (
        <RNETooltip
            containerStyle={classicStyles(theme).tooltipContainer}
            backgroundColor={Platform.OS === "web" ? "#fff" : theme.colors.background}
            overlayColor={theme.colors.backdropColor}
            popover={<Text style={classicStyles(theme).popoverText}>{text}</Text>}
        >
            {children}
        </RNETooltip>
    )
}