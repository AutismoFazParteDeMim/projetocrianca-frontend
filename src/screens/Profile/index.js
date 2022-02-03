import React, { useContext } from "react"
import { View } from "react-native"
import { BackButton, CoverContainer, InfoContainer, ProfileButton, ProfilePic, UserName } from "./styles"

import { AuthenticatedUserContext } from "../../navigation/AuthenticatedUserProvider"

export default function Profile({ navigation }) {
    const { user } = useContext(AuthenticatedUserContext)

    return (
        <View>
            <CoverContainer source={{ uri: "https://eskipaper.com/images/kids-wallpaper-21.jpg" }}>
                <BackButton icon="chevron-back" onPress={() => navigation.goBack()} />
            </CoverContainer>
            <InfoContainer>
                <ProfileButton>
                    <ProfilePic source={{ uri: "https://www.shareicon.net/data/512x512/2016/06/26/786558_people_512x512.png" }} />
                </ProfileButton>
                <UserName>{user.displayName}</UserName>
            </InfoContainer>
        </View>
    )
}