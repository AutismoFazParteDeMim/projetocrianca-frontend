import React, { useState } from 'react'
import { View, Text, Image } from 'react-native'
import styles from './styles'
import Header from '../../components/Header'

import Slider from '../../components/Slider'

import SlidesRotina from "./data"

function Rotinas({ navigation }) {

    function render({ item }) {
        return (
            <View style={styles.globalContainer}>
                <Header title="Rotinas" />
                <Image
                    source={item.image}
                    style={styles.image}
                />
                <Text style={[styles.globalText, styles.descricao]}>{item.text}</Text>
            </View>
        )
    }

    return (
        <Slider navigation={navigation} data={SlidesRotina} render={render} />
    )
}

export default Rotinas