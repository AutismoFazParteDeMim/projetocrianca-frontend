import styled from "styled-components/native"
import { Text } from "../../components"
import { SvgXml } from "react-native-svg"

export const Container = styled.KeyboardAvoidingView`
    flex: 1;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
`

export const Header = styled.View`
    width: 100%;
    height: ${props => props.theme.metrics.headerHeight};
    padding: ${props => props.theme.metrics.headerPadding} 0 0 0;
    flex-direction: row;
    align-items: center;
    margin-bottom: ${props => props.theme.metrics.padding};
    justify-content: space-between;
`

export const ProfilePic = styled(SvgXml)`
    width: 60px;
    height: 60px;
    border-radius: 50px;
`

export const ProfileButton = styled.TouchableOpacity`
    border-radius: 50px;
    background-color: ${props => props.theme.colors.card};
`

export const SearchBarContainer = styled.View`
    width: 220px;
`

export const UserNameText = styled(Text)`
    font-family: ${props => props.theme.fonts.subTitle.font};
    font-size: ${props => props.theme.fonts.subTitle.size};
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
    margin-bottom: ${props => props.theme.metrics.padding};
`