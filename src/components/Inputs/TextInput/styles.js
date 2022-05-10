import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    width: 100%;
    height: ${props => props.theme.metrics.input.height};
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    flex-direction: row;
    align-items: center;
    margin-bottom: ${props => props.theme.metrics.padding};
    border-radius: ${props => props.theme.metrics.input.borderRadius};
    background-color: ${props => props.theme.colors.card};
`

export const Input = styled.TextInput.attrs((props) => (
    {
        placeholderTextColor: props.theme.colors.text,
        selectionColor: props.theme.colors.primary,
    }
))`
    width: 80%;
    height: ${props => props.theme.metrics.input.height};
    font-family: ${props => props.theme.fonts.text.font};
    font-size: ${props => props.theme.fonts.text.size};
    padding-top: ${props => props.theme.fonts.text.paddingTop};
    padding-right: ${props => props.theme.metrics.padding};
    color: ${props => props.theme.colors.text};
`

export const Icon = styled(Ionicons)`
    font-size: ${props => props.theme.metrics.input.iconSize};
    margin-right: ${props => props.theme.metrics.padding};
    color: ${props => props.theme.colors.text};
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: ${props => props.theme.metrics.padding};
`

export const ButtonIcon = styled(Icon)`
    margin: 0;
`