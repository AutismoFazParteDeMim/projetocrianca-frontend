import styled from "styled-components/native"
import Text from "../../Text"

export const Container = styled.TouchableOpacity`
    width: ${({ theme }) => theme.metrics.squareButton.width}px;
    height: ${({ theme }) => theme.metrics.squareButton.height}px;
    align-items: center;
    justify-content: center;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${({ theme }) => theme.metrics.squareButton.borderBottomWidth}px;
    border-radius: ${({ theme }) => theme.metrics.squareButton.borderRadius}px;
    border-color: ${({ theme }) => theme.colors.cardShadow};
    background-color: ${({ theme }) => theme.colors.card};
`

export const Image = styled.Image`
    width: ${({ theme }) => theme.metrics.squareButton.imageSize}px;
    height: ${({ theme }) => theme.metrics.squareButton.imageSize}px;
    margin-bottom: 10px;
`

export const Title = styled(Text)`
    color: ${({ theme }) => theme.colors.text};
`