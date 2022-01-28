import styled from "styled-components/native"
import fonts from "../../../theme/fonts"
import Text from "../../Text"

export const LinkText = styled(Text)`
    font-family: ${fonts.button.font};
    text-decoration: underline;
    color: ${props => props.theme.colors.primary}
`