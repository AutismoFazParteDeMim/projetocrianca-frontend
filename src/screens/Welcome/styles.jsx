import styled from "styled-components/native"
import { Text } from "../../components"

export const Container = styled.View`
    flex: 1;
`

export const TopContainer = styled.View`
    height: 50%;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: ${props => props.theme.colors.primary};
`

export const BottomContainer = styled(TopContainer)`
    background-color: ${props => props.theme.colors.background};
`

export const Title = styled(Text)`
    font-family: ${props => props.theme.fonts.title.font};
    font-size:  ${props => props.theme.fonts.title.size};
    text-align: center;
    margin-bottom: ${props => props.theme.metrics.padding};
    color: ${props => props.theme.colors.textAltLight};
`

export const WelcomeText = styled(Title)`
    font-family: ${props => props.theme.fonts.subTitle.font};
    font-size: ${props => props.theme.fonts.subTitle.size};
`

export const ButtonsContainer = styled(BottomContainer)`
    height: 40%;
    justify-content: space-between;
`

export const PrivacyPolicyContainer = styled(Container)`
    padding: 0 0 ${props => props.theme.metrics.padding} 0;
`