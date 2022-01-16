import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import Text from "../../Text"

export const Container = styled.TouchableOpacity`
    width: ${metrics.squareButton.width};
    height: ${metrics.squareButton.height};
    align-items: center;
    justify-content: center;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${metrics.squareButton.borderBottomWidth};
    border-radius: ${metrics.squareButton.borderRadius};
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.card};
`

export const Image = styled.Image`
    width: ${metrics.squareButton.imageSize};
    height: ${metrics.squareButton.imageSize};
    margin-bottom: 10px;
`

export const Title = styled(Text)`
    color: ${props => props.theme.colors.text};
`