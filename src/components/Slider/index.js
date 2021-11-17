import React, { useState } from 'react'
import AppIntroSlider from 'react-native-app-intro-slider'

import styles from "./styles"
import { Icon } from '../../styles'


function Slider(props) {
    return (
        <AppIntroSlider
            renderItem={props.render}
            data={props.data}
            activeDotStyle={styles.botaoPaginacao}
            renderNextButton={() => <Icon name="chevron-forward-outline" style={[styles.globalIcon, styles.icon]} />}
            renderDoneButton={() => <Icon name="checkmark" style={[styles.globalIcon, styles.icon]} />}
            onDone={() => props.navigation.goBack()}
        />
    )
}
export default Slider