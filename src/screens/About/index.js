import React, { useState, useEffect } from "react"
import { Linking, ScrollView } from "react-native"
import { Container, GitHubButton, Image, View, TextAbout } from "./styles"
import { getGitData } from "./api"
import { Text } from "../../components"


export default function About({ navigation }) {
    const [data, setData] = useState([{
        "login": "lracha",
        "id": 92896125,
        "node_id": "U_kgDOBYl7fQ",
        "avatar_url": "https://avatars.githubusercontent.com/u/92896125?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/lracha",
        "html_url": "https://github.com/lracha",
        "followers_url": "https://api.github.com/users/lracha/followers",
        "following_url": "https://api.github.com/users/lracha/following{/other_user}",
        "gists_url": "https://api.github.com/users/lracha/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/lracha/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/lracha/subscriptions",
        "organizations_url": "https://api.github.com/users/lracha/orgs",
        "repos_url": "https://api.github.com/users/lracha/repos",
        "events_url": "https://api.github.com/users/lracha/events{/privacy}",
        "received_events_url": "https://api.github.com/users/lracha/received_events",
        "type": "User",
        "site_admin": false,
        "contributions": 3
    },])

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
                <Text>Desenvolvedores: </Text>
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