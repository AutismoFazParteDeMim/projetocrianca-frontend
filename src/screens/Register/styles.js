import styled from "styled-components/native"
import { Button } from "../../components"

export const Container = styled.KeyboardAvoidingView.attrs(() => ({
    contentContainerStyle: {
        alignItems: "center",
    }
}))`
    flex: 1;
    width: 100%;
    padding: ${props => props.theme.metrics.padding};
    justify-content: center;
`

export const Form = styled.ScrollView.attrs(() => ({
    contentContainerStyle: {
        alignItems: "center"
    }
}))`
    width: 100%;
`

export const Image = styled.Image`
    height: 40%;
    margin-bottom: ${props => props.theme.metrics.padding};
`

export const ChildsModalContainer = styled(Container)`
    padding: 0;
    justify-content: space-evenly;
`

export const SexPickerContainer = styled.View`
    width: 100%;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
   
`

export const SexPickerItem = styled.TouchableOpacity`
    align-items: center;
    justify-content: center;
`

export const SexPickerItemImage = styled.Image`
    width: 80px;
    height: 80px;
    border-radius: 50px;
    border: ${props => props.active ? "2px solid " + props.theme.colors.primary : "none"};
`

export const GoogleButton = styled(Button).attrs(({ theme }) => ({
    textColor: theme.colors.textAltDark
}))`
    width: 100%;
    margin-bottom: 16px;
    border-color: gray;
    background-color: whitesmoke;
`

export const FacebookButton = styled(GoogleButton).attrs(({ theme }) => ({
    textColor: theme.colors.textAltLight
}))`
    border-color: #0B5AC1;
    background-color: #1877F2;
`