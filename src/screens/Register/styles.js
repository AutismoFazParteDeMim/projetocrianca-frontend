import styled from "styled-components/native"
import metrics from "../../theme/metrics"

export const Container = styled.KeyboardAvoidingView`
    flex: 1;
    padding: ${metrics.padding};
    align-items: center;
    justify-content: space-between;
`
export const Form = styled.ScrollView.attrs(() => ({
    contentContainerStyle: {alignItems: "center"}
}))`
    width: 100%;
`

export const Image = styled.Image`
    height: 40%;
    resize-mode: contain;
    margin-bottom: ${metrics.padding};
`

export const ChildsModalContainer = styled(Container)`
    padding: 0;
    justify-content: center;
`