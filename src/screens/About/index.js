import React,{useState, useEffect} from "react"
import {Linking} from "react-native"
import {Container, GitHubButton, Image, View, TextAbout, ScrollView} from "./styles"
import {getGitData} from "./api"
import {Text} from "../../components"


export default function About ({ navigation }) {
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
    },[])
   

    return ( 
    <Container>
        <TextAbout>A idealizadora do projeto foi a Rose, uma mãe dedicada e uma cidadã exemplar, que 
            criou uma apostila para lidar com as dificuldades que a mesma tinha com a sua filha, 
            e além disso fez cópias das apostilas para ajudar outras mães que enfrentam a mesma 
            dificuldade. Com a ajuda do Farol eles entraram em contato com a Unisociesc que 
            através dos projetos de extensão, os alunos que tiveram interesse no projeto que a 
            Rose havia idealizado se inscreveram no projeto e começaram a fazer ele andar, 
            juntamente com a mentoria do Diego Possamai os alunos colocaram a mão na massa 
            e desde então o projeto vem crescendo cada vez mais e auxiliando várias famílias. 
        </TextAbout>

        <View>
            <Text>Desenvolvedores: </Text>
            <ScrollView horizontal = {true}>
                {data.map((item, index) => (
                    <Image key={index} source={{uri:item.avatar_url}}/>
                    ) ) }
                
            </ScrollView>
        </View>

      
        

        <GitHubButton title="GitHub" icon="logo-github" type="Custom" onPress ={()=> Linking.openURL("https://github.com/AutismoFazParteDeMim/ProjetoCrianca")}/>

    </Container>
    
    )


}