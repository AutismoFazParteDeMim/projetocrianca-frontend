import { useContext } from 'react'
import AppIntroSlider from 'react-native-app-intro-slider'
import { ThemeContext } from 'styled-components/native'
import CircleButton from "../Buttons/CircleButton"

import { classicStyles } from "./styles"

export default function Slider({ data, renderItem, navigation }) {
    const theme = useContext(ThemeContext)

    return (
        <AppIntroSlider
            renderItem={renderItem}
            data={data}
            dotStyle={classicStyles(theme).dot}
            activeDotStyle={classicStyles(theme).activeDot}
            renderNextButton={() => <CircleButton icon="chevron-forward" isStatic />}
            renderDoneButton={() => <CircleButton icon="checkmark" isStatic />}
            onDone={() => navigation.goBack()}
        />
    )
}