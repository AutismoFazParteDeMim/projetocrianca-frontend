import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.TouchableOpacity`
    width: ${props => props.theme.metrics.circleButton.width};
    height: ${props => props.theme.metrics.circleButton.height};
    align-items: center;
    justify-content: center;
    border-radius: ${props => props.theme.metrics.circleButton.borderRadius};
    border-bottom-width: ${props => props.theme.metrics.circleButton.borderBottomWidth};
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.background};
`

export const ContainerStatic = styled.View`
    width: ${props => props.theme.metrics.circleButton.width};
    height: ${props => props.theme.metrics.circleButton.height};
    align-items: center;
    justify-content: center;
    border-radius: ${props => props.theme.metrics.circleButton.borderRadius};
    border-bottom-width: ${props => props.theme.metrics.circleButton.borderBottomWidth};
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.background};
`

export const Icon = styled(Ionicons)`
    font-size: ${props => props.theme.metrics.circleButton.iconSize};
    color: ${props => props.theme.colors.text};
`