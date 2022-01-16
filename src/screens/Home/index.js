import React from "react"
import { Platform } from "react-native"
import SearchBar from "../../components/Inputs/SearchBar"
import { Container, Header, ProfilePic, ProfileButton, SearchBarContainer } from "./styles"

export default function Home({ navigation }) {
    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Header>
                <ProfileButton onPress={() => navigation.navigate("Profile")}>
                    <ProfilePic source={{ uri: "https://www.shareicon.net/data/512x512/2016/06/26/786558_people_512x512.png" }} />
                </ProfileButton>
                <SearchBarContainer>
                    <SearchBar />
                </SearchBarContainer>
            </Header>
        </Container>
    )
}