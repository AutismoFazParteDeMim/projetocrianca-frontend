import styled from "styled-components/native"
import Text from "../Text"

export const Container = styled.View`
    width: 100%;
    height: ${({ theme }) => theme.metrics.headerHeight}px;
    padding: ${({ theme }) => theme.metrics.headerPadding}px ${({ theme }) => theme.metrics.padding}px;
    padding-bottom: 0px;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    background-color: ${({ theme, backgroundColor }) => backgroundColor ?? theme.colors.background};
`

export const Content = styled(Container)`
    padding: 0px;
    background-color: transparent;
`

export const Title = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.title.font};
    font-size: ${({ theme }) => theme.fonts.title.size}px;
    color: ${({ theme, titleColor }) => titleColor ?? theme.colors.text};
`

export const BackButton = styled.View`
    position: absolute;
    left: 0px;
`

export const OptionsContainer = styled.View`
    position: absolute;
    right: 0px;
`