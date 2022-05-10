import React from "react"
import { View, Platform } from "react-native"
import { BackButton, CoverContainer, InfoContainer, ProfileButton, ProfilePic, UserName } from "./styles"
import { SvgXml } from "react-native-svg"
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
                    {child.childPic && Platform.OS === "web" ? <svg xmlns={child.childPic} width={100} height={100} /> : <SvgXml xml={child.childPic} width={100} height={100} />}
                </ProfileButton>
                <UserName>{child.childName}</UserName>
            </InfoContainer>
        </View>
    )
}