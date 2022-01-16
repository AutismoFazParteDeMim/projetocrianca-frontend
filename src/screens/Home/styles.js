import styled from "styled-components/native"
import { KeyboardAvoidingView } from "react-native"
import metrics from "../../theme/metrics"

export const Container = styled(KeyboardAvoidingView)`
    flex: 1;
`

export const Header = styled.View`
    width: 100%;
    height: 120px;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
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