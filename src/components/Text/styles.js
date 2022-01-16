import styled from "styled-components/native"
import fonts from "../../theme/fonts"
import { Text } from "react-native-elements"

export const CustomText = styled(Text)`
    font-family: ${fonts.text.font};
    font-size: ${fonts.text.size};
    padding-top: ${fonts.text.paddingTop};
`