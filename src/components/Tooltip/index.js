import React from "react"
import { Platform } from "react-native"
import { Tooltip as RNETooltip } from 'react-native-elements'
import { useTheme } from 'styled-components'
import Text from "../../components/Text"

export default function Tooltip({ children, ...props }) {
    const theme = useTheme()

    return (
        <RNETooltip
            containerStyle={{ width: 145, height: 130 }}
            backgroundColor={Platform.OS === "web"? "#fff" : theme.colors.background}
            overlayColor="#000000e6"
            popover={<Text style={Platform.OS === "web" && {color: "#3D3D3D"}}>{props.text}</Text>}
        >
            {children}
        </RNETooltip>
    )
}