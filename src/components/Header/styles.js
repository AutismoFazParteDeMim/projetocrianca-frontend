import styled from "styled-components/native"
import fonts from "../../theme/fonts"
import metrics from "../../theme/metrics"
import Text from "../Text"

export const Container = styled.View`
    width: 100%;
    height: ${metrics.headerHeight};
    padding: ${metrics.headerPadding} ${metrics.padding} 0 ${metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: center;
    background-color: ${props => props.theme.colors.background};
`

export const Content = styled(Container)`
    padding: 0px;
`

export const Title = styled(Text)`
    font-family: ${fonts.title.font};
    font-size: ${fonts.title.size};
`

export const BackButton = styled.View`
    position: absolute;
    left: 0;
`