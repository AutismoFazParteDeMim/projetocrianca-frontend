import styled from "styled-components/native"
import { Text } from "../../../../components"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
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

export const Title = styled(Text)`
    font-family: ${props => props.theme.fonts.subTitle.font};
    font-size: ${props => props.theme.fonts.subTitle.size};
    text-transform: capitalize;
    text-align: center;
`

export const Descrição = styled(Text)`
    text-align: center;
    margin-top: 60px;
`