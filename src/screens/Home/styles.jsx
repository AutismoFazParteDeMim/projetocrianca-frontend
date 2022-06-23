import styled from "styled-components/native"
import { Text } from "../../components"

export const Container = styled.KeyboardAvoidingView`
    flex: 1;
    padding: 0px ${props => props.theme.metrics.padding}px;
`

export const Header = styled.View`
    width: 100%;
    height: ${props => props.theme.metrics.headerHeight}px;
    padding: ${props => props.theme.metrics.headerPadding}px ${({ theme }) => theme.metrics.padding}px;
    padding-bottom: 0px;
    flex-direction: row;
    align-items: center;
    margin-bottom: ${props => props.theme.metrics.padding}px;
    justify-content: space-between;
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
    font-size: ${props => props.theme.fonts.subTitle.size}px;
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
    margin-bottom: ${props => props.theme.metrics.padding}px;
`