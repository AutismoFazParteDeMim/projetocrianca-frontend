import React from "react"
import { SafeAreaView, View, Image } from "react-native"

import styles from "./styles"
import Header from "../../components/Header"
import InputText from "../../components/Input/InputText"
import InputPass from "../../components/Input/InputPass"
import Button from "../../components/Button"
import Link from "../../components/Link"

function Login({ navigation }) {
    return (
<<<<<<< HEAD
        <View style={styles.globalContainer}>
=======
        
>>>>>>> 9f91f376fa561c12dc9a6a0c89facecf432ce148
            <Header title="Login" navigation={navigation} />
            
            <View style={[styles.container]}>

                <InputText type="email" icon="mail-outline" placeholder="Insira seu e-mail" />
                <InputPass type="password" icon="lock-closed-outline" placeholder="Insira sua senha" />

                <View style={styles.link} >

                <Link text="Esqueceu sua senha?" />
                

                </View>

                <Button icon="enter-outline" iconPosition="left" title="Entrar" />
                <Image source={require('../../../assets/animais.png')} style={styles.animals} />
                
            </View>
        </View>
    )
}

export default Login