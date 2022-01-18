import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import { Ionicons } from "@expo/vector-icons"
import Text from "../../Text"
import fonts from "../../../theme/fonts"

export const Container = styled.TouchableOpacity`
    width: ${metrics.button.width};
    height: ${metrics.button.height};
    flex-direction: ${props => props.inverted ? "row-reverse" : "row"};
    align-items: center;
    justify-content: center;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${metrics.button.borderBottomWidth};
    border-radius: ${metrics.button.borderRadius};
    ${props =>
        props.type === "primary" || props.type == null ? "background-color:" + props.theme.colors.primary + "; border-color:" + props.theme.colors.primaryShadow
            : props.type === "secondary" ? "background-color:" + props.theme.colors.card + "; border-color:" + props.theme.colors.cardShadow
                : props.type === "success" ? "background-color:" + props.theme.colors.success + "; border-color:" + props.theme.colors.successShadow
                    : props.type === "danger" ? "background-color:" + props.theme.colors.danger + "; border-color:" + props.theme.colors.dangerShadow
                        : "background-color:" + props.backgroundColor + "; border-color:" + props.backgroundColor
    }
`

export const ButtonIcon = styled(Ionicons)`
    font-size: ${metrics.button.iconSize};
    color: ${props => props.textColor ? props.textColor : props.theme.colors.textAltLight};
`

export const ButtonTitle = styled(Text)`
    font-family: ${fonts.button.font};
    font-size: ${fonts.button.size};
    padding-top: ${fonts.button.paddingTop};
    color: ${props => props.textColor ? props.textColor : props.theme.colors.textAltLight};
    margin: 0 ${metrics.padding} 0 ${metrics.padding};
`