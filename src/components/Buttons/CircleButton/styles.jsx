import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.TouchableOpacity`
    width: ${({ theme }) => theme.metrics.circleButton.width}px;
    height: ${({ theme }) => theme.metrics.circleButton.height}px;
    align-items: center;
    justify-content: center;
    border-radius: ${({ theme }) => theme.metrics.circleButton.borderRadius}px;
    border-bottom-width: ${({ theme }) => theme.metrics.circleButton.borderBottomWidth}px;
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${({ theme }) => theme.colors.cardShadow};
    background-color: ${({ theme }) => theme.colors.background};
`

export const ContainerStatic = styled.View`
    width: ${({ theme }) => theme.metrics.circleButton.width}px;
    height: ${({ theme }) => theme.metrics.circleButton.height}px;
    align-items: center;
    justify-content: center;
    border-radius: ${({ theme }) => theme.metrics.circleButton.borderRadius}px;
    border-bottom-width: ${({ theme }) => theme.metrics.circleButton.borderBottomWidth}px;
    border-left-width: 0.3px;
    border-right-width: 0.3px;
    border-color: ${({ theme }) => theme.colors.cardShadow};
    background-color: ${({ theme }) => theme.colors.background};
`

export const Icon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.circleButton.iconSize}px;
    color: ${({ theme }) => theme.colors.text};
`