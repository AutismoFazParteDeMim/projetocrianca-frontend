import styled from "styled-components/native"
import Text from "../../Text"
import { Ionicons } from "@expo/vector-icons"

export const Container = styled.View`
    flex: 1;
    padding: 0px ${({ theme }) => theme.metrics.padding}px;
    align-items: center;
    justify-content: center;
    background-color: ${({ theme }) => theme.colors.backdropColor};
`
export const ModalView = styled.View`
    width: 100%;
    height: ${({ size }) => size === "medium" ? "400px" : size === "large" ? "500px" : "300px"};
    padding: ${({ theme }) => theme.metrics.padding}px;
    border-left-width: 0.1px;
    border-right-width: 0.1px;
    border-bottom-width: ${({ theme }) => theme.metrics.squareButton.borderBottomWidth}px;
    border-radius: ${({ theme }) => theme.metrics.squareButton.borderRadius}px;
    border-color: ${({ theme }) => theme.colors.cardShadow};
    background-color: ${({ theme }) => theme.colors.background};
`

export const Header = styled.View`
    width: 100%;
    margin-bottom: ${({ theme }) => theme.metrics.padding}px;
    flex-direction: row;
    align-items: center;
    justify-content: center;
`

export const Button = styled.TouchableOpacity`
    position: absolute;
    right: 0;
`

export const Icon = styled(Ionicons)`
    font-size: ${({ theme }) => theme.metrics.button.iconSize}px;
    color: ${({ theme }) => theme.colors.text};
`

export const Title = styled(Text)`
    font-family: ${({ theme }) => theme.fonts.subTitle.font};
    font-size: ${({ theme }) => theme.fonts.subTitle.size}px;
`