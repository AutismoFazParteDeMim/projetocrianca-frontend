import styled from "styled-components/native"
import Text from "../../components/Text"
import fonts from "../../theme/fonts"
import metrics from "../../theme/metrics"

export const Container = styled.View`
    flex: 1;
`

export const TopContainer = styled.View`
    height: 50%;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-color: ${props => props.theme.colors.primary};
`

export const BottomContainer = styled(TopContainer)`
    background-color: ${props => props.theme.colors.background};
`

export const Title = styled(Text)`
    font-family: ${fonts.title.font};
    font-size:  ${fonts.title.size};
    text-align: center;
    margin-bottom: ${metrics.padding};
    color: ${props => props.theme.colors.textAltLight};
`

export const WelcomeText = styled(Title)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
`

export const ButtonsContainer = styled(BottomContainer)`
    height: 40%;
    justify-content: space-between;
`