import styled from "styled-components/native"
import { Button, Text } from "../../components"

export const Container = styled.View`
    flex : 1;
    padding: ${({ theme }) => theme.metrics.padding}px;
    align-items : center;
    justify-content : space-between; 
   
`
export const GitHubButton = styled(Button).attrs((props) => ({
    backgroundColor: "#3D3D3D",
    textColor: props.theme.colors.textAltLight,
}))``

export const Image = styled.Image`
    width : 80px;
    height : 80px; 
    border-radius : 50px;
    margin-right : ${({ theme }) => theme.metrics.padding}px;
`

export const View = styled.View`
    width : 100%;
    justify-content : space-between;
`

export const TextAbout = styled(Text)`
    text-align : justify;
`