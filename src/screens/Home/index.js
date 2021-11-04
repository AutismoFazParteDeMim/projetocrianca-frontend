import React, { useContext } from "react"
import { Text, View, Image, TouchableOpacity } from "react-native"

import styles from "./styles"
import InputText from "../../components/Input/InputText"
import SquareButton from "../../components/Button/SquareButton"

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"

function Home({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext);
    const handleSignOut = async () => {
        try {
            await auth.signOut();
        } catch (error) {
            console.log(error);
        }
    };
    return (
        <View style={{ flex: 1 }}>

            <View style={styles.headerHome}>
                <TouchableOpacity >
                    <Image style={styles.iconPerson} source={require('../../../assets/User.jpg')} />
                </TouchableOpacity>
                <View style={styles.containerInputSearch}>
                    <InputText placeholder='Pesquise aqui.' icon={'ios-search'} />
                </View>
            </View>

            <View style={styles.globalContainer}>
                <Text style={styles.globalSubtitle}>Bem-vindo(a)!! {"\n" + user.displayName}</Text>
                <View style={styles.container}>
                    <View style={styles.grid}>
                        <SquareButton type='secondary' image={require('../../../assets/books.png')} title="Atividades" />
                        <SquareButton type='secondary' image={require('../../../assets/parque-infantil.png')} title="Jogos" />

                    </View>
                    <View style={styles.grid}>
                        <SquareButton type='secondary' image={require('../../../assets/cogwheel.png')} title="Configurações" />
                    </View>
                </View>
            </View>

        </View >
    )
}

export default Home