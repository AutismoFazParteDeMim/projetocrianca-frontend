import styled from "styled-components/native"
import Text from "../../Text"

export const LinkText = styled(Text)`
    font-family: ${props => props.theme.fonts.button.font};
    text-decoration: underline;
    text-decoration-color: ${props => props.theme.colors.primary};
    color: ${props => props.theme.colors.primary};
`