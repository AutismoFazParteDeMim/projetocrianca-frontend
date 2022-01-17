import styled from "styled-components/native"
import metrics from "../../theme/metrics"
import Text from "../../components/Text"
import fonts from "../../theme/fonts"
import {Ionicons} from "@expo/vector-icons"

export const Container = styled.View`
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
`

export const Section = styled.View`
    margin-bottom: ${metrics.padding};
`

export const SectionTitle = styled(Text)`
    font-family: ${fonts.sectionTitle.font};
    font-size: ${fonts.sectionTitle.size};
`

export const OptionContainer = styled.View`
    width: 100%;
    height: ${metrics.input.height};
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    margin-bottom: ${metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    border-radius: ${metrics.input.borderRadius};
    background-color: ${props => props.theme.colors.card};

`

export const OptionIcon = styled(Ionicons)`
    font-size: ${metrics.input.iconSize};
    color: ${props => props.theme.colors.text};
    margin-right: ${metrics.padding};
`

export const TextContainer = styled.View`
    flex-direction: row;
    align-items: center;
    justify-content: center;
`