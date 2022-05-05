import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import Header from "../../../components/Header"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    padding: ${metrics.padding};
    background-color: ${props => props.theme.colors.primary};
`

export const CustomHeader = styled(Header).attrs((props) => ({
    backgroundColor: props.theme.colors.primary,
    titleColor: props.theme.colors.textAltLight
}))``

export const Card = styled.TouchableOpacity`
    width: 100px;
    height: 130px;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    background-color: #fff;
`

export const CardImage = styled.Image`
    width: 60px;
    height: 120px;
    resize-mode: contain;
`