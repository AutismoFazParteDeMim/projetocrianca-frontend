import React, { useState } from 'react'
import AppIntroSlider from 'react-native-app-intro-slider'

import styles from "./styles"

import CloseButton from "../Button/CloseButton"
import { ThemeContext } from "../../styles/ThemeProvider"


function Slider(props) {
    const { colors } = useContext(ThemeContext)

    return (
        <AppIntroSlider
            renderItem={props.render}
            data={props.data}
            dotStyle={styles(colors).dot}
            activeDotStyle={styles(colors).activeDot}
            renderNextButton={() => <CloseButton icon="chevron-forward" static={true} />}
            renderDoneButton={() => <CloseButton icon="checkmark" static={true} />}
            onDone={() => props.navigation.goBack()}
        />
    )
}
export default Slider