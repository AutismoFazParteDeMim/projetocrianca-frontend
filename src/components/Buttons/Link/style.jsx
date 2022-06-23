import styled from "styled-components/native"
import Text from "../../Text"

export const LinkText = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.button.font};
    text-decoration: underline;
    text-decoration-color: ${({ theme }) => theme.colors.primary};
    color: ${({ theme }) => theme.colors.primary};
`