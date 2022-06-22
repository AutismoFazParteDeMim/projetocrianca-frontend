import styled from "styled-components/native"
import { Header, Text } from "../../components"

export const Container = styled.View`
    flex: 1;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    background-color: ${props => props.theme.colors.primary};
`

export const Item = styled.View`
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
`

export const Image = styled.Image`
    width: 200px;
    height: 200px;
    resize-mode: contain;
    margin-bottom: ${props => props.theme.metrics.padding};
`

export const Descrição = styled(Text)`
    text-align: center;
    margin-top: 60px;
    color: ${props => props.theme.colors.textAltLight};
`

export const CustomHeader = styled(Header).attrs(({ theme }) => ({
    backgroundColor: theme.colors.primary,
    titleColor: theme.colors.textAltLight,
}))``