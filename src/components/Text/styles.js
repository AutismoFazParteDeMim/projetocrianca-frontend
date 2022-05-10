import styled from "styled-components/native"
import { Text } from "react-native-elements"

export const CustomText = styled(Text)`
    font-family: ${props => props.theme.fonts.text.font};
    font-size: ${props => props.theme.fonts.text.size};
    padding-top: ${props => props.theme.fonts.text.paddingTop};
    color: ${props => props.theme.colors.text}
`