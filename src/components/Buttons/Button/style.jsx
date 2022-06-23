import styled from "styled-components/native"
import { Ionicons } from "@expo/vector-icons"
import Text from "../../Text"

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
    ${({ theme, type, backgroundColor }) =>
        type === "primary" || type == null ? `background-color: ${theme.colors.primary}; border-color: ${theme.colors.primaryShadow}`
            : type === "secondary" ? `background-color: ${theme.colors.card}; border-color: ${theme.colors.cardShadow}`
                : type === "success" ? `background-color: ${theme.colors.success}; border-color: ${theme.colors.successShadow}`
                    : type === "danger" ? `background-color: ${theme.colors.danger}; border-color: ${theme.colors.dangerShadow}`
                        : `background-color: ${backgroundColor}; border-color: ${backgroundColor}`
    }
`

export const ButtonIcon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.button.iconSize}px;
    color: ${({ theme, textColor, type }) => textColor ? textColor : type != "secondary" ? theme.colors.textAltLight : theme.colors.text};
`

export const ButtonTitle = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.button.font};
    font-size: ${({ theme }) => theme.fonts.button.size}px;
    padding-top: ${({ theme }) => theme.fonts.button.paddingTop}px;
    color: ${({ theme, textColor, type }) => textColor ? textColor : type != "secondary" ? theme.colors.textAltLight : theme.colors.text};
    margin: 0px ${({ theme }) => theme.metrics.padding}px 0px ${({ theme }) => theme.metrics.padding}px;
`