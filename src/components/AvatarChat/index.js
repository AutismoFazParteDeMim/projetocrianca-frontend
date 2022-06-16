import { ChatContainer, Container } from "./styles"
import { useSelector } from 'react-redux'
import { SvgXml } from 'react-native-svg'
import Text from "../Text"

export default function AvatarChat({ text }) {
    const { child } = useSelector(state => state.user)

    return (
        <Container>
            {
                child.childPic &&
                <SvgXml xml={child.childPic} width={100} height={100} />
            }
            <ChatContainer>
                <Text>
                    {text}
                </Text>
            </ChatContainer>
        </Container>
    )
}