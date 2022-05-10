import styled from "styled-components/native"

export const Container = styled.View`
    flex: 1;
    padding: ${props => props.theme.metrics.padding};
    align-items: center;
    justify-content: space-between;
`
export const Form = styled.ScrollView.attrs({
    contentContainerStyle: { alignItems: "center" }
})`
    flex: 1;
    width: 100%;
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