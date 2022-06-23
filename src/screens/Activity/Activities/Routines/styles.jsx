import styled from "styled-components/native"
import { Text } from "../../../../components"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    padding: 0px ${props => props.theme.metrics.padding}px;
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
    margin-bottom: ${props => props.theme.metrics.padding}px;
`

export const Title = styled(Text)`
    font-family: ${props => props.theme.fonts.subTitle.font};
    font-size: ${props => props.theme.fonts.subTitle.size}px;
    text-transform: capitalize;
    text-align: center;
`

export const Descrição = styled(Text)`
    text-align: center;
    margin-top: 60px;
`