import CircleButton from "../Buttons/CircleButton"

import { Container, Title, BackButton, Content, OptionsContainer } from "./styles"


export default function Header({ title, backgroundColor, titleColor, backAction, children, navigation, ...props }) {
    return (
        <Container backgroundColor={backgroundColor} {...props}>
            <Content>
                <BackButton>
                    <CircleButton icon="chevron-back" onPress={() => backAction ?? navigation.goBack()} />
                </BackButton>
                <Title titleColor={titleColor}>{title}</Title>
                <OptionsContainer>
                    {children}
                </OptionsContainer>
            </Content>
        </Container>
    )
}