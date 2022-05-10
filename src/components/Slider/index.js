import React, { useContext } from 'react'
import AppIntroSlider from 'react-native-app-intro-slider'
import { ThemeContext } from 'styled-components/native'

import styles from "./styles"
import CircleButton from "../Buttons/CircleButton"

export default function Slider(props) {
    const theme = useContext(ThemeContext)

    return (
        <AppIntroSlider
            renderItem={props.renderItem}
            data={props.data}
            dotStyle={styles(theme).dot}
            activeDotStyle={styles(theme).activeDot}
            renderNextButton={() => <CircleButton icon="chevron-forward" static={true} />}
            renderDoneButton={() => <CircleButton icon="checkmark" static={true} />}
            onDone={() => props.navigation.goBack()}
        />
    )
}