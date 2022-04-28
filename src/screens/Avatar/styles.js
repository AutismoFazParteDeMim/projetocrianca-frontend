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
    width: 80%;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
`

export const StyleItem = styled.TouchableOpacity`
    width: 40px;
    height: 40px;
    border-radius: 12px;
    background-color: ${item => item.color != null ? item.color : item.theme.colors.card};
`