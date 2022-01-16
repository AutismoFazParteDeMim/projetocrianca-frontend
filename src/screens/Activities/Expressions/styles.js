import styled from "styled-components/native"
import metrics from "../../../theme/metrics"
import Text from "../../../components/Text"
import fonts from "../../../theme/fonts"

export const Container = styled.View`
    flex: 1;
    width: 100%;
    height: 100%;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
`

export const Item = styled.View`
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
`

export const Image = styled.Image`
    width: 200px;
    height: 200px;
    resize-mode: contain;
    margin-bottom: ${metrics.padding};
`

export const Title = styled(Text)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
    text-transform: capitalize;
    text-align: center;
`

export const Descrição = styled(Text)`
    text-align: center;
    margin-top: 60px;
`