import styled from "styled-components/native"
import { Header } from "../../../components"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    padding: ${({ theme }) => theme.metrics.padding}px;
    align-items: center;
    justify-content: space-between;
    background-color: ${({ theme }) => theme.colors.primary};
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

export const CardImage = styled.Image.attrs(() => ({
    resizeMode: "contain"
}))`
    width: 60px;
    height: 100px;
`