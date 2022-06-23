import styled from "styled-components/native"

export const CustomText = styled.Text`
    font-family: ${props => props.theme.fonts.text.font};
    font-size: ${props => props.theme.fonts.text.size}px;
    padding-top: ${props => props.theme.fonts.text.paddingTop}px;
    color: ${props => props.theme.colors.text}
`