import React, { useState, useEffect } from "react"
import { Platform } from "react-native"
import { SquareButton, SearchBar } from "../../components"
import { SvgXml } from "react-native-svg"

import { useSelector, useDispatch } from "react-redux"
import { firstTime as firstTimeAction } from "../../redux/modules/settings/actions"

import { Container, Header, ProfileButton, SearchBarContainer, UserNameText, Grid, GridRow } from "./styles"

export default function Home({ navigation }) {
    const dispatch = useDispatch()
    const { firstTime } = useSelector((state) => state.settings)
    const { child } = useSelector((state) => state.user)
    const [first, setFirst] = useState(true)

    useEffect(() => {
        if (firstTime) {
            setFirst(false)
            dispatch(firstTimeAction(first))
            navigation.navigate("Avatar")
        }
    }, [first])

    return (
        <Container behavior={Platform.OS === "ios" ? "padding" : "height"}>
            <Header>
                {/* <ProfileButton onPress={() => navigation.navigate("Profile")}>
                    {child.childPic && Platform.OS === "web" ? <svg xmlns={child.childPic} width={60} height={60} /> : <SvgXml xml={child.childPic} width={60} height={60} />}
                </ProfileButton> */}
                <SearchBarContainer>
                    <SearchBar />
                </SearchBarContainer>
            </Header>

            <UserNameText>Bem vind{child.childSex === "female" ? "a!" : "o!"}{"\n" + child.childName}</UserNameText>

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