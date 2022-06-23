import styled from "styled-components/native"
import { Text } from "../../components"

export const Container = styled.View`
    flex: 1;
`

export const TopContainer = styled.View`
    height: 50%;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: ${({ theme }) => theme.colors.primary};
`

export const BottomContainer = styled(TopContainer)`
    background-color: ${({ theme }) => theme.colors.background};
`

export const Title = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.title.font};
    font-size:  ${({ theme }) => theme.fonts.title.size}px;
    text-align: center;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    color: ${({ theme }) => theme.colors.textAltLight};
`

export const WelcomeText = styled(Title)`
    font-family: ${({ theme }) => theme.fonts.subTitle.font};
    font-size: ${({ theme }) => theme.fonts.subTitle.size}px;
`

export const ButtonsContainer = styled(BottomContainer)`
    height: 40%;
    justify-content: space-between;
`

export const PrivacyPolicyContainer = styled(Container)`
    padding: 0px 0px ${({ theme }) => theme.metrics.padding}px 0px;
`