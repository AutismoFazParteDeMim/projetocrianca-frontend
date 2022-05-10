import styled from "styled-components/native"
import { Text } from "../../components"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    padding: ${props => props.theme.metrics.padding};
`

export const Section = styled.View`
    margin-bottom: ${props => props.theme.metrics.padding};
`

export const SectionTitle = styled(Text)`
    font-family: ${props => props.theme.fonts.sectionTitle.font};
    font-size: ${props => props.theme.fonts.sectionTitle.size};
`

export const SectionContent = styled.View`
    align-items: center;
    justify-content: center;
`

export const OptionContainer = styled.View`
    width: 100%;
    height: ${props => props.theme.metrics.input.height};
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    margin-bottom: ${props => props.theme.metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    border-radius: ${props => props.theme.metrics.input.borderRadius};
    background-color: ${props => props.theme.colors.card};
`

export const OptionIcon = styled(Ionicons)`
    font-size: ${props => props.theme.metrics.input.iconSize};
    color: ${props => props.theme.colors.text};
    margin-right: ${props => props.theme.metrics.padding};
`

export const TextContainer = styled.View`
    flex-direction: row;
    align-items: center;
    justify-content: center;
`