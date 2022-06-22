import styled from "styled-components/native"
import { SearchBar as RNESearchBar } from 'react-native-elements';

export const Container = styled.View`
    height: ${props => props.theme.metrics.input.height};
    border-radius: ${props => props.theme.metrics.input.padding};
    background-color: ${props => props.theme.colors.card};
`
export const CustomSearchBar = styled(RNESearchBar)`
    height: 100%;
    font-family: ${props => props.theme.fonts.text.font};
    font-size: ${props => props.theme.fonts.text.size};
    padding-top: 4px;
`