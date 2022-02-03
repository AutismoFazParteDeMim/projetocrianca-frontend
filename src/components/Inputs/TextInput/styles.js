import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import { Ionicons } from "@expo/vector-icons"
import fonts from "../../../theme/fonts"

export const Container = styled.View`
    width: 100%;
    height: ${metrics.input.height};
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    flex-direction: row;
    align-items: center;
    margin-bottom: ${metrics.padding};
    border-radius: ${metrics.input.borderRadius};
    background-color: ${props => props.theme.colors.card};
`

export const Input = styled.TextInput.attrs((props) => (
    {
        placeholderTextColor: props.theme.colors.text,
        selectionColor: props.theme.colors.primary,
    }
))`
    width: 80%;
    height: ${metrics.input.height};
    font-family: ${fonts.text.font};
    font-size: ${fonts.text.size};
    padding-top: ${fonts.text.paddingTop};
    padding-right: ${metrics.padding};
    color: ${props => props.theme.colors.text};
`

export const Icon = styled(Ionicons)`
    font-size: ${metrics.input.iconSize};
    margin-right: ${metrics.padding};
    color: ${props => props.theme.colors.text};
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: ${metrics.padding};
`

export const ButtonIcon = styled(Icon)`
    margin: 0;
`