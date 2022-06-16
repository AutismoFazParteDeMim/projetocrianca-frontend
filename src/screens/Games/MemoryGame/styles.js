import styled from "styled-components/native"
import { Header } from "../../../components"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: space-between;
    padding: ${props => props.theme.metrics.padding};
    background-color: ${props => props.theme.colors.primary};
`

export const CustomHeader = styled(Header).attrs((props) => ({
    backgroundColor: props.theme.colors.primary,
    titleColor: props.theme.colors.textAltLight
}))``

export const Card = styled.TouchableOpacity`
    width: 100%;
    height: 100px;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    background-color: #fff;
`

export const CardImage = styled.Image`
    width: 60px;
    height: 100px;
    resize-mode: contain;
`