import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    width: 100%;
    height: ${({ theme }) => theme.metrics.input.height}px;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: center;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    border-radius: ${({ theme }) => theme.metrics.input.borderRadius}px;
    background-color: ${({ theme }) => theme.colors.card};
`

export const Input = styled.TextInput.attrs((props) => (
    {
        placeholderTextColor: props.theme.colors.text,
        selectionColor: props.theme.colors.primary,
    }
))`
    width: 80%;
    height: ${({ theme }) => theme.metrics.input.height}px;
    font-family: ${({ theme }) => theme.fonts.text.font};
    font-size: ${({ theme }) => theme.fonts.text.size}px;
    padding-top: ${({ theme }) => theme.fonts.text.paddingTop}px;
    padding-right: ${({ theme }) => theme.metrics.padding}px;
    color: ${({ theme }) => theme.colors.text};
`

export const Icon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.input.iconSize}px;
    margin-right: ${({ theme }) => theme.metrics.padding}px;
    color: ${({ theme }) => theme.colors.text};
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: ${({ theme }) => theme.metrics.padding}px;
`

export const ButtonIcon = styled(Icon)`
    margin: 0px;
`