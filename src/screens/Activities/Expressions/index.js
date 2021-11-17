import React from 'react'
import { View, Text, Image } from 'react-native'
import styles from './styles'
import Header from '../../../components/Header'

import Slider from '../../../components/Slider'

import data from "./data"

function Expressions({ navigation }) {

    function render({ item }) {
        return (
            <View style={styles.globalSliderContainer}>
                <Image
                    source={item.image}
                    style={styles.image}
                />
                <Text style={[styles.globalText, styles.descricao]}>{item.text}</Text>
            </View>
        )
    }

    return (
        <View style={styles.globalContainer}>
            <Header title="Expressões" />
            <Slider navigation={navigation} data={data} render={render} />
        </View>
    )
}

export default Expressions