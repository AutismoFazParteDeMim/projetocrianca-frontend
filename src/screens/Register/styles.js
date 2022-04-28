import styled from "styled-components/native"
import metrics from "../../theme/metrics"

export const Container = styled.KeyboardAvoidingView`
    flex: 1;
    padding: ${metrics.padding};
    align-items: center;
    justify-content: space-between;
`
export const Form = styled.ScrollView.attrs(() => ({
    contentContainerStyle: { alignItems: "center" }
}))`
    width: 100%;
`

export const Image = styled.Image`
    height: 40%;
    margin-bottom: ${metrics.padding};
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
