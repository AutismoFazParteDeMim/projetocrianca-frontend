import styled from "styled-components/native"
import { Text, CircleButton } from "../../components"

export const CoverContainer = styled.ImageBackground`
    width: 100%;
    height: 250px;
`

export const BackButton = styled(CircleButton)`
    position: absolute;
    left: ${props => props.theme.metrics.padding};
    top: ${props => props.theme.metrics.headerPadding};
`

export const InfoContainer = styled.View`
    width: 100%;
    height: 100px;
    flex-direction: row;
    align-items: flex-end;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    position: absolute;
    bottom: -50px;
`

export const UserName = styled(Text)`
    font-family: ${props => props.theme.fonts.subTitle.font};
    font-size: ${props => props.theme.fonts.subTitle.size};
`

export const ProfileButton = styled.TouchableOpacity`
    width: 100px;
    height: 100px;
    border-radius: 50px;
    margin-right: ${props => props.theme.metrics.padding};
    background-color: ${props => props.theme.colors.card};
`