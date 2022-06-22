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

export const Form = styled.View`
    width: 100%;
    align-items: center;
`

export const ForgotPassButtonContaier = styled.View`
    width: 100%;
    padding: 0 ${props => props.theme.metrics.padding} 0 ${props => props.theme.metrics.padding};
    margin-top: -${props => props.theme.metrics.padding};
    margin-bottom: ${props => props.theme.metrics.padding};
    align-items: flex-end;
    justify-content: center;
`

export const ForgotPassModalContainer = styled.View`
    flex: 1;
    align-items: center;
    justify-content: space-between;
`

export const Image = styled.Image`
    height: 40%;
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