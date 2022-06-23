import styled from "styled-components/native"
import { Header, Text } from "../../components"

export const Container = styled.View`
    flex: 1;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    background-color: ${({ theme }) => theme.colors.primary};
`

export const Item = styled.View`
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
`

export const Image = styled.Image.attrs(() => ({
    resizeMode: "contain"
}))`
    width: 200px;
    height: 200px;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
`

export const Descrição = styled(Text)`
    text-align: center;
    margin-top: 60px;
    color: ${({ theme }) => theme.colors.textAltLight};
`

export const CustomHeader = styled(Header).attrs(({ theme }) => ({
    backgroundColor: theme.colors.primary,
    titleColor: theme.colors.textAltLight,
}))``