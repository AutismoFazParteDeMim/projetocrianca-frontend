import styled from "styled-components/native"

export const Container = styled.View`
    flex: 1;
    align-items: center;
    justify-content: space-evenly;
`

export const StylesContainer = styled.View`
    align-items: center;
    justify-content: center;
`

export const StylesRow = styled.View`
    width: 90%;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
`

export const StyleItem = styled.TouchableOpacity`
    width: ${props => props.image ? 50 : 40}px;
    height:  ${props => props.image ? 50 : 40}px;
    margin-top: 12px;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    ${props => props.color && "background-color:" + props.color}
`

export const HairImage = styled.Image`
    width: 60px;
    height: 70px;
`