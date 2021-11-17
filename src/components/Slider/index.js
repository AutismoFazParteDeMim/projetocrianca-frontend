import React, { useState } from 'react'
import AppIntroSlider from 'react-native-app-intro-slider'

import styles from "./styles"

import CloseButton from "../Button/CloseButton"


function Slider(props) {
    return (
        <AppIntroSlider
            renderItem={props.render}
            data={props.data}
            dotStyle={styles.dot}
            activeDotStyle={styles.activeDot}
            renderNextButton={() => <CloseButton icon="chevron-forward" static={true} />}
            renderDoneButton={() => <CloseButton icon="checkmark" static={true} />}
            onDone={() => props.navigation.goBack()}
        />
    )
}
export default Slider