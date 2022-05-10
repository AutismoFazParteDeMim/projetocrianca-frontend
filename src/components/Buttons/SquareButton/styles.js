import styled from "styled-components/native"
import Text from "../../Text"

export const Container = styled.TouchableOpacity`
    width: ${props => props.theme.metrics.squareButton.width};
    height: ${props => props.theme.metrics.squareButton.height};
    align-items: center;
    justify-content: center;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${props => props.theme.metrics.squareButton.borderBottomWidth};
    border-radius: ${props => props.theme.metrics.squareButton.borderRadius};
    border-color: ${props => props.theme.colors.cardShadow};
    background-color: ${props => props.theme.colors.card};
`

export const Image = styled.Image`
    width: ${props => props.theme.metrics.squareButton.imageSize};
    height: ${props => props.theme.metrics.squareButton.imageSize};
    margin-bottom: 10px;
`

export const Title = styled(Text)`
    color: ${props => props.theme.colors.text};
`