import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.TouchableOpacity`
    width: ${metrics.circleButton.width};
    height: ${metrics.circleButton.height};
    align-items: center;
    justify-content: center;
    border-radius: ${metrics.circleButton.borderRadius};
    border-bottom-width: ${metrics.circleButton.borderBottomWidth};
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.background};
`

export const ContainerStatic = styled.View`
    width: ${metrics.circleButton.width};
    height: ${metrics.circleButton.height};
    align-items: center;
    justify-content: center;
    border-radius: ${metrics.circleButton.borderRadius};
    border-bottom-width: ${metrics.circleButton.borderBottomWidth};
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.background};
`

export const Icon = styled(Ionicons)`
    font-size: ${metrics.circleButton.iconSize};
    color: ${props => props.theme.colors.text};
`