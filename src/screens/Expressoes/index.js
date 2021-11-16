import React, { useState } from 'react';
import { View, Text, Image } from 'react-native';
import AppIntroSlider from 'react-native-app-intro-slider';
import { SlidesExpressoes } from '../../components/Slides/Expressoes';
import styles from './styles';
import Header from '../../components/Header';
import { Icon } from '../../styles';

function Rotinas({ navigation }) {
    const [showHome, setShowHome] = useState(false);

    function renderSlides({ item }) {
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

    if (showHome) {
        return <View></View>
    } else {
        return (
            <AppIntroSlider
                renderItem={renderSlides}
                data={SlidesExpressoes}
                activeDotStyle={styles.botaoPaginacao}
                renderNextButton={() => <Icon name="chevron-forward-outline" style={[styles.globalIcon, styles.icon]} />}
                renderDoneButton={() => <Icon name="checkmark" style={[styles.globalIcon, styles.icon]} />}
                onDone={() => navigation.navigate("Welcome")}
            />
        )
    }

}

export default Rotinas;