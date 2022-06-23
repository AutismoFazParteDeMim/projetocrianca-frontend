import styled from "styled-components/native"
import { Button } from "../../components"

export const Container = styled.KeyboardAvoidingView.attrs(() => ({
    contentContainerStyle: {
        alignItems: "center",
    }
}))`
    flex: 1;
    width: 100%;
    padding: ${({ theme }) => theme.metrics.padding}px;
    justify-content: center;
`

export const Form = styled.View`
    width: 100%;
    align-items: center;
`

export const ForgotPassButtonContaier = styled.View`
    width: 100%;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    margin-top: -${({ theme }) => theme.metrics.padding}px;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
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