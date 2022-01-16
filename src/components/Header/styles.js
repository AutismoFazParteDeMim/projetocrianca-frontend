import styled from "styled-components/native"
import metrics from "../../theme/metrics"
import Text from "../Text"

export const Container = styled.View`
    width: 100%;
    height: ${metrics.headerHeight};
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    flex-direction: row;
    align-items: center;
    justify-content: center;
    background-color: ${props => props.theme.colors.background};
`

export const Title = styled(Text)`
    font-family: "bold";
    font-size: 34px;
`

export const BackButton = styled.View`
    position: absolute;
    left: ${metrics.padding};
`