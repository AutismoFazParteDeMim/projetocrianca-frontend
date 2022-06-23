import styled from "styled-components/native"
import { Platform } from "react-native"
import Text from "../../Text"
import { Ionicons } from "@expo/vector-icons"

export const Item = styled.TouchableOpacity`
    width: 100%;
    max-height: 140px;
    padding: ${({ theme }) => theme.metrics.padding}px;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${({ theme }) => theme.metrics.squareButton.borderBottomWidth}px;
    border-radius: ${({ theme }) => theme.metrics.squareButton.borderRadius}px;
    border-color: ${({ theme }) => theme.colors.cardShadow};
    background-color: ${({ theme }) => theme.colors.card};
`

export const Image = styled.Image`
    width: 50px;
    height: 50px;
    margin-right: ${({ theme }) => theme.metrics.padding}px;
`

export const Title = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.button.font};
    font-size: ${({ theme }) => theme.fonts.button.size}px;
    margin-bottom: -6px;
`

export const Icon = styled(Ionicons)`
    position: absolute;
    right: ${({ theme }) => theme.metrics.padding}px;
    font-size: 24px;
    color: ${({ theme }) => theme.colors.text};
`

export const LeftSide = styled.View`
    flex-direction: row;
    align-items: center;
`

export const TextContainer = styled.View`
    width: ${Platform.OS === "web" ? "40%" : "70%"};
`