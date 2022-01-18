import React from "react"
import { View } from "react-native"
import { BackButton, Container, CoverContainer, InfoContainer, ProfileButton, ProfilePic, UserName } from "./styles"

export default function Profile({ navigation }) {
    return (
        <View>
            <CoverContainer source={{ uri: "https://eskipaper.com/images/kids-wallpaper-21.jpg" }}>
                <BackButton icon="chevron-back" onPress={() => navigation.goBack()} />
            </CoverContainer>
            <InfoContainer>
                <ProfileButton>
                    <ProfilePic source={{ uri: "https://www.shareicon.net/data/512x512/2016/06/26/786558_people_512x512.png" }} />
                </ProfileButton>
                <UserName>Nome do Usuário</UserName>
            </InfoContainer>
        </View>
    )
}