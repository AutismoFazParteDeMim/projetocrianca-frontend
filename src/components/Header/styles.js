import styled from "styled-components/native"
import Text from "../Text"

export const Container = styled.View`
    width: 100%;
    height: ${props => props.theme.metrics.headerHeight};
    padding: ${props => props.theme.metrics.headerPadding} ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: center;
    background-color: ${props => props.backgroundColor ?? props.theme.colors.background};
`

export const Content = styled(Container)`
    padding: 0px;
    background-color: transparent;
`

export const Title = styled(Text)`
    font-family: ${props => props.theme.fonts.title.font};
    font-size: ${props => props.theme.fonts.title.size};
    color: ${props => props.titleColor ?? props.theme.colors.text};
`

export const BackButton = styled.View`
    position: absolute;
    left: 0;
`