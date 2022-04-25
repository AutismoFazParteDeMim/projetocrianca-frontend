import styled from "styled-components/native"
import CircleButton from "../../components/Buttons/CircleButton"
import metrics from "../../theme/metrics"
import Text from "../../components/Text"
import fonts from "../../theme/fonts"
import { SvgXml } from "react-native-svg"

export const CoverContainer = styled.ImageBackground`
    width: 100%;
    height: 250px;
    resize-mode: contain;
`

export const BackButton = styled(CircleButton)`
    position: absolute;
    left: ${metrics.padding};
    top: ${metrics.headerPadding};
`

export const InfoContainer = styled.View`
    width: 100%;
    height: 100px;
    flex-direction: row;
    align-items: flex-end;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
    position: absolute;
    bottom: -50px;
`

export const UserName = styled(Text)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
`

export const ProfileButton = styled.TouchableOpacity`
    width: 100px;
    height: 100px;
    border-radius: 50px;
    margin-right: ${metrics.padding};
    background-color: ${props => props.theme.colors.text};
`

export const ProfilePic = styled(SvgXml)`
    width: 100px;
    height: 100px;
    border-radius: 50px;
`
