import styled from "styled-components/native"
import { KeyboardAvoidingView } from "react-native"
import metrics from "../../theme/metrics"
import Text from "../../components/Text"
import fonts from "../../theme/fonts"

export const Container = styled(KeyboardAvoidingView)`
    flex: 1;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
`

export const Header = styled.View`
    width: 100%;
    height: 120px;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
`

export const ProfilePic = styled.Image`
    width: 60px;
    height: 60px;
    border-radius: 50px;
`

export const ProfileButton = styled.TouchableOpacity`
    border-radius: 50px;
    background-color: ${props => props.theme.colors.text};
`

export const SearchBarContainer = styled.View`
    width: 240px;
`

export const UserNameText = styled(Text)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
`

export const Grid = styled.View`
    flex: 1;
    align-items: center;
    justify-content: center;
`

export const GridRow = styled.View`
    width: 100%;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
    margin-bottom: ${metrics.padding};
`