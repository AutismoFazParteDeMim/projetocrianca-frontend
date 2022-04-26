import styled from "styled-components/native"
import metrics from "../../theme/metrics"
import Text from "../../components/Text"
import fonts from "../../theme/fonts"
import { SvgXml } from "react-native-svg"

export const Container = styled.KeyboardAvoidingView`
    flex: 1;
    padding: 0 ${metrics.padding} 0 ${metrics.padding};
`

export const Header = styled.View`
    width: 100%;
    height: ${metrics.headerHeight};
    padding: ${metrics.headerPadding} 0 0 0;
    flex-direction: row;
    align-items: center;
    margin-bottom: ${metrics.padding};
    justify-content: space-between;
`

export const ProfilePic = styled(SvgXml)`
    width: 60px;
    height: 60px;
    border-radius: 50px;
`

export const ProfileButton = styled.TouchableOpacity`
    border-radius: 50px;
    background-color: #E5E5E5;
`

export const SearchBarContainer = styled.View`
    width: 220px;
`

export const UserNameText = styled(Text)`
    font-family: ${fonts.subTitle.font};
    font-size: ${fonts.subTitle.size};
`

export const Grid = styled.View`
    flex: 1;
    align-items: center;
    justify-content: center;
`

export const GridRow = styled.View`
    width: 100%;
    flex-direction: row;
    align-items: center;
    justify-content: space-around;
    margin-bottom: ${metrics.padding};
`