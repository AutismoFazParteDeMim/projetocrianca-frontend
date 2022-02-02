import styled from "styled-components/native"
import metrics from "../../theme/metrics"

export const Container = styled.View`
    flex: 1;
    padding: ${metrics.padding};
    align-items: center;
    justify-content: space-between;
`
export const Form = styled.View`
    flex: 1;
    width: 100%;
    align-items: center;
    justify-content: center;
`

export const ForgotPassButtonContaier = styled.View`
    width: 100%;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    margin-top: -${metrics.padding};
    margin-bottom: ${metrics.padding};
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
    resize-mode: contain;
`