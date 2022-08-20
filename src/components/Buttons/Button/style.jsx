import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"
import Text from "../../Text"

function variants(variant, payload = "primary", theme) {
    return {
        type: {
            primary: `
                background-color: ${theme.colors.primary};
                border-color: ${theme.colors.primaryShadow};
            `,
            secondary: `
                background-color: ${theme.colors.card};
                border-color: ${theme.colors.cardShadow};
            `,
            success: `
                background-color: ${theme.colors.success};
                border-color: ${theme.colors.successShadow};
            `,
            danger: `
                background-color: ${theme.colors.danger};
                border-color: ${theme.colors.dangerShadow};
            `,
        },
        textColor: {
            primary: `
                color: ${theme.colors.textAltLight};
            `,
            secondary: `
                color: ${theme.colors.text};
            `,
            success: `
                color: ${theme.colors.textAltLight};
            `,
            danger: `
                color: ${theme.colors.textAltLight};
            `,
        }
    }[ variant ][ payload ]
}

export const Container = styled.TouchableOpacity`
    width: ${({ theme }) => theme.metrics.button.width}px;
    height: ${({ theme }) => theme.metrics.button.height}px;
    flex-direction: ${({ inverted }) => inverted ? "row-reverse" : "row"};
    align-items: center;
    justify-content: center;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${({ theme }) => theme.metrics.button.borderBottomWidth}px;
    border-radius: ${({ theme }) => theme.metrics.button.borderRadius}px;
    border-color: ${({ borderColor }) => borderColor};
    background-color: ${({ backgroundColor }) => backgroundColor};
    ${({ type, theme, backgroundColor, borderColor }) => (backgroundColor || borderColor) ?? variants("type", type, theme)};
`

export const ButtonIcon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.button.iconSize}px;
    color: ${({ textColor }) => textColor};
    ${({ theme, textColor, type }) => textColor ?? variants("textColor", type, theme)};
`

export const ButtonTitle = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.button.font};
    font-size: ${({ theme }) => theme.fonts.button.size}px;
    padding-top: ${({ theme }) => theme.fonts.button.paddingTop}px;
    margin: 0px ${({ theme }) => theme.metrics.padding}px 0px ${({ theme }) => theme.metrics.padding}px;
    color: ${({ textColor }) => textColor};
    ${({ theme, textColor, type }) => textColor ?? variants("textColor", type, theme)};
`