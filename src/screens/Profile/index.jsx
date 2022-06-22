import { View, Platform } from "react-native"
import { SvgXml } from "react-native-svg"
import { useSelector } from "react-redux"

import { BackButton, CoverContainer, InfoContainer, ProfileButton, ProfilePic, UserName } from "./styles"

export default function Profile({ navigation }) {
    const { child } = useSelector((state) => state.user)

    return (
        <View>
            <CoverContainer source={{ uri: "https://eskipaper.com/images/kids-wallpaper-21.jpg" }}>
                <BackButton icon="chevron-back" onPress={() => navigation.goBack()} />
            </CoverContainer>
            <InfoContainer>
                <ProfileButton onPress={() => navigation.navigate("Avatar")}>
                    {child.childPic && Platform.OS === "web" ? child.childPic && <svg xmlns={child.childPic} width={100} height={100} /> : child.childPic && <SvgXml xml={child.childPic} width={100} height={100} />}
                </ProfileButton>
                <UserName>{child.childName}</UserName>
            </InfoContainer>
        </View>
    )
}