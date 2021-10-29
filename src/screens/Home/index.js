import React from "react"
import {View, Text, TouchableOpacity, Image} from "react-native"
import Icon from "@expo/vector-icons/Ionicons";
import Input from "../../components/Input/InputText";
import styles from "./styles";


function Home({ navigation }) {
    return (
        <View style={styles.container}>
            <View>
                <Icon name="person-circle-outline" size={25} color="#00A7DF"/>
                <Icon name="search-outline" size={25} color="#000"/>
                <Input/>
            </View>
            <View >
                <Text>Bem Vindo (a) Nome!</Text>
            </View>
            <View>
                <TouchableOpacity>
                    <Image
                        source={require('../../assets/books.png')} />
                    <Image
                        source={require('../../assets/cogwheel.png')} />
                    <Image
                        source={require('../../assets/parque-infantil.png')} />
                </TouchableOpacity>
            </View>
        </View>
    )
}

export default Home