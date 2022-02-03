import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import fonts from "../../../theme/fonts"
import Text from "../../Text"

import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    flex: 1;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    align-items: center;
    justify-content: center;
    background-color: rgba(0,0,0,0.6);
`
export const ModalView = styled.View`
    width: 100%;
    height: ${props => props.size === "medium" ? "400px" : props.size === "large" ? "500px" : "300px"};
    padding: ${metrics.padding};
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${metrics.squareButton.borderBottomWidth};
    border-radius: ${metrics.squareButton.borderRadius};
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.background};
`

export const Header = styled.View`
    width: 100%;
    flex-direction: row;
    align-items: center;
    justify-content: center;
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: 0;
`

export const Icon = styled(Ionicons)`
    font-size: ${metrics.button.iconSize};
    color: ${props => props.theme.colors.text};
`

export const Title = styled(Text)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
`