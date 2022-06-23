import styled from "styled-components/native"
import { SearchBar as RNESearchBar } from 'react-native-elements';
import { StyleSheet } from 'react-native';

export const Container = styled.View`
    height: ${({ theme }) => theme.metrics.input.height}px;
    border-radius: ${({ theme }) => theme.metrics.input.padding}px;
    background-color: ${({ theme }) => theme.colors.card};
`

export const CustomSearchBar = styled(RNESearchBar)`
    height: 100%;
    font-family: ${({ theme }) => theme.fonts.text.font};
    font-size: ${({ theme }) => theme.fonts.text.size}px;
    padding-top: 4px;
`

export const classicStyles = StyleSheet.create({
    inputContainerStyle: {
        height: "100%",
        borderRadius: 16,
        backgroundColor: "transparent"
    }
})