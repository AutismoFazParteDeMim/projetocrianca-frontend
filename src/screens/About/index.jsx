import { useState, useEffect } from "react"
import { Linking, ScrollView } from "react-native"
import { getGitData } from "./api"
import { Text } from "../../components"

import { Container, GitHubButton, Image, View, TextAbout } from "./styles"

export default function About({ navigation }) {
    const [data, setData] = useState([{}])

    useEffect(() => {
        const getData = async () => {
            let data = await getGitData()
            setData(data.data)
        }
        getData()
    }, [])

    return (
        <Container>
            <TextAbout>
                A idealizadora do projeto Rose, uma mãe dedicada e uma cidadã exemplar, criou uma apostila para lidar com as dificuldades que ela mesma tinha em criar sua filha, e, além disso, fez cópias para ajudar outras mães que enfrentam a mesma dificuldade. Com a ajuda do Farol entraram em contato com a Unisociesc que através dos projetos de extensão, permitiu o desenvolvimento de um aplicativo que conterá muito mais do que o conteúdo da apostila.
                Com mentoria de Diego Possamai o aplicativo começou a ser desenvolvido em 2020 pelos alunos e hoje já conta com algumas atividades, jogos educativos e a personalização do avatar.
            </TextAbout>

            <View>
                <Text style={{ marginBottom: 16 }}>Desenvolvedores: </Text>
                <ScrollView horizontal={true}>
                    {data.map((item, index) => (
                        <Image key={index} source={{ uri: item.avatar_url }} />
                    ))}
                </ScrollView>
            </View>

            <GitHubButton title="GitHub" icon="logo-github" type="Custom" onPress={() => Linking.openURL("https://github.com/AutismoFazParteDeMim/ProjetoCrianca")} />
        </Container>
    )
}