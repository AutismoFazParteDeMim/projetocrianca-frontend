import styled from "styled-components/native"
import { Button, Text } from "../../components"

export const Container = styled.View`
    flex : 1;
    padding: ${({ theme }) => theme.metrics.padding}px;
    align-items : center;
    justify-content : space-between; 
   
`

export const DeveloperContainer = styled.TouchableOpacity`
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-right : ${({ theme }) => theme.metrics.padding}px;
`

export const Image = styled.Image`
    width : 80px;
    height : 80px; 
    border-radius : 50px;
`

export const View = styled.View`
    width : 100%;
    justify-content : space-between;
`

export const TextAbout = styled(Text)`
    text-align : justify;
`

export const GitHubButton = styled(Button).attrs((props) => ({
    textColor: props.theme.colors.textAltLight,
    backgroundColor: "#3D3D3D",
    borderColor: "#282828",
}))``