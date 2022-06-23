import styled from "styled-components/native"
import { Text } from "../../components"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    padding: ${({ theme }) => theme.metrics.padding}px;
`

export const Section = styled.View`
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
`

export const SectionTitle = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.sectionTitle.font};
    font-size: ${({ theme }) => theme.fonts.sectionTitle.size}px;
`

export const SectionContent = styled.View`
    align-items: center;
    justify-content: center;
`

export const OptionContainer = styled.View`
    width: 100%;
    height: ${({ theme }) => theme.metrics.input.height}px;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    border-radius: ${({ theme }) => theme.metrics.input.borderRadius}px;
    background-color: ${({ theme }) => theme.colors.card};
`

export const OptionIcon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.input.iconSize}px;
    color: ${({ theme }) => theme.colors.text};
    margin-right: ${({ theme }) => theme.metrics.padding}px;
`

export const TextContainer = styled.View`
    flex-direction: row;
    align-items: center;
    justify-content: center;
`