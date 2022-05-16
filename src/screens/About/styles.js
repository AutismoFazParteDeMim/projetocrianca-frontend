import styled from "styled-components/native"
import {Button, Text} from "../../components"

export const Container = styled.View`
    flex : 1;
    padding: ${props => props.theme.metrics.padding};
    align-items : center;
    justify-content : space-between; 
   
`
export const GitHubButton = styled(Button).attrs((props)=> ({
    backgroundColor : props.theme.colors.text, 
    textColor : props.theme.colors.textAltLight,

}))``

export const Image = styled.Image`
    width : 80px;
    height : 80px; 
    border-radius : 50px;
    margin-right : ${props => props.theme.metrics.padding}
`

export const View = styled.View`
    width : 100%;
    justify-content : space-between;
`

export const TextAbout = styled(Text)`
text-align : justify
`
export const ScrollView = styled.ScrollView.attrs((props) =>({
    contentContainerStyle : { width : "100%"}

}))``
