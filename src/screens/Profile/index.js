import React from "react"
import { View } from "react-native"
import { BackButton, CoverContainer, InfoContainer, ProfileButton, ProfilePic, UserName } from "./styles"

import { useSelector } from "react-redux"

export default function Profile({ navigation }) {
    const { child } = useSelector((state) => state.user)

    return (
        <View>
            <CoverContainer source={{ uri: "https://eskipaper.com/images/kids-wallpaper-21.jpg" }}>
                <BackButton icon="chevron-back" onPress={() => navigation.goBack()} />
            </CoverContainer>
            <InfoContainer>
                <ProfileButton onPress={() => navigation.navigate("Avatar")}>
                    <ProfilePic xml={child.childPic} />
                </ProfileButton>
                <UserName>{child.childName}</UserName>
            </InfoContainer>
        </View>
    )
}