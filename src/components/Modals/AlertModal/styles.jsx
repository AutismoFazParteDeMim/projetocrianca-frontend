import styled from "styled-components/native"
import Text from "../../Text"
import { Ionicons } from "@expo/vector-icons"

function variants(variant, payload = "default", theme) {
    return {
        type: {
            default: `
                background-color: ${theme.colors.card}; 
                border-color: ${theme.colors.cardShadow}
            `,
            success: `
                background-color: ${theme.colors.success};
                border-color: ${theme.colors.successShadow};
            `,
            warning: `
                background-color: ${theme.colors.warning};
                border-color: ${theme.colors.warningShadow};
            `,
            danger: `
                background-color: ${theme.colors.danger};
                border-color: ${theme.colors.dangerShadow};
            `,
        },
        textColor: {
            default: `
                color: ${theme.colors.text};
            `,
            warning: `
                color: ${theme.colors.text};
            `,
            success: `
                color: ${theme.colors.text};
            `,
            danger: `
                color: ${theme.colors.text};
            `,
        }
    }[ variant ][ payload ]
}

export const Container = styled.View`
    flex: 1;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    align-items: center;
    justify-content: center;
    background-color: ${({ theme }) => theme.colors.backdropColor};
`

export const ModalView = styled.View`
    width: 100%;
    height: 200px;
    padding: ${({ theme }) => theme.metrics.padding}px;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${({ theme }) => theme.metrics.squareButton.borderBottomWidth}px;
    border-radius: ${({ theme }) => theme.metrics.squareButton.borderRadius}px;
    ${({ type, theme }) => variants("type", type, theme)};
`

export const Content = styled.View`
    flex: 1;
    align-items: center;
    justify-content: center;
`

export const Header = styled.View`
    width: 100%;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: center;
    justify-content: center;
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: 0px;
`

export const ButtonIcon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.button.iconSize}px;
    ${({ theme, type }) => variants("textColor", type, theme)};
`

export const Icon = styled(ButtonIcon)`
    font-size: 40px;
    ${({ theme, type }) => variants("textColor", type, theme)};
`

export const Title = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.subTitle.font};
    font-size: ${({ theme }) => theme.fonts.subTitle.size}px;
    ${({ theme, type }) => variants("textColor", type, theme)};
`

export const WarningText = styled(Text)`
    text-align: center;
    ${({ theme, type }) => variants("textColor", type, theme)};
`