import styled from "styled-components/native"
import { Text, CircleButton } from "../../components"

export const CoverContainer = styled.ImageBackground`
    width: 100%;
    height: 250px;
`

export const BackButton = styled(CircleButton)`
    position: absolute;
    left: ${({ theme }) => theme.metrics.padding}px;
    top: ${({ theme }) => theme.metrics.headerPadding}px;
`

export const InfoContainer = styled.View`
    width: 100%;
    height: 100px;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: flex-end;
    position: absolute;
    bottom: -50px;
`

export const UserName = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.subTitle.font};
    font-size: ${({ theme }) => theme.fonts.subTitle.size}px;
`

export const ProfileButton = styled.TouchableOpacity`
    width: 100px;
    height: 100px;
    border-radius: 50px;
    margin-right: ${({ theme }) => theme.metrics.padding}px;
    background-color: ${({ theme }) => theme.colors.card};
`