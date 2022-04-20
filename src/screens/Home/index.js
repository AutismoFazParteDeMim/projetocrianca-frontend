import React, { useContext } from "react"
import { Platform } from "react-native"
import SquareButton from "../../components/Buttons/SquareButton"
import SearchBar from "../../components/Inputs/SearchBar"

import { Container, Header, ProfilePic, ProfileButton, SearchBarContainer, UserNameText, Grid, GridRow } from "./styles"

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"


export default function Home({ navigation }) {
    const { child } = useContext(AuthenticatedUserContext)

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

            <UserNameText>Bem vind{child.childSex === "f" ? "a!" : "o!" + "\n" + child.childName}</UserNameText>

            <Grid>
                <GridRow>
                    <SquareButton title="Atividades" image={require("../../../assets/icons/activities-icon.png")} onPress={() => navigation.navigate("Activity")} />
                    <SquareButton title="Jogos" image={require("../../../assets/icons/games-icon.png")} onPress={() => navigation.navigate("Games")} />
                </GridRow>
                <GridRow>
                    <SquareButton title="Configurações" image={require("../../../assets/icons/settings-icon.png")} onPress={() => navigation.navigate("Settings")} />
                </GridRow>
            </Grid>
        </Container>
    )
}