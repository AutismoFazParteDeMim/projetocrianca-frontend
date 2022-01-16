import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import fonts from "../../../theme/fonts"
import Text from "../../Text"
import { Ionicons } from "@expo/vector-icons"
import { Platform } from "react-native"

export const Item = styled.TouchableOpacity`
    width: 100%;
    height: 140px;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    margin-bottom: ${metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${metrics.squareButton.borderBottomWidth};
    border-radius: 24px;
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.card};
`

export const Image = styled.Image`
    width: 60px;
    height: 60px;
    margin-right: ${metrics.padding};
`

export const Title = styled(Text)`
    font-family: ${fonts.button.font};
    font-size: ${fonts.button.size};
    margin-bottom: -4px;
`

export const Icon = styled(Ionicons)`
    font-size: 24px;
    color: ${props => props.theme.colors.text};
`

export const LeftSide = styled.View`
    flex-direction: row;
    align-items: center;

`

export const TextContainer = styled.View`
    width: ${Platform.OS === "web" ? "40%" : "70%"};

`