import { useState } from "react"
import { Switch } from "react-native-elements"
import { Text, Tooltip, Button } from "../../components"
import { TouchableOpacity } from "react-native"
import { signOut } from "firebase/auth"
import { auth } from "../../config/firebase"
import { useSelector, useDispatch } from "react-redux"
import { switchTheme } from "../../redux/modules/settings/actions"

import { Container, OptionContainer, OptionIcon, Section, SectionTitle, TextContainer, SectionContent } from "./styles"

export default function Settings({ navigation }) {
    const dispatch = useDispatch()
    const { theme } = useSelector((state) => state.settings)
    const [ colorblindMode, setColorblindMode ] = useState(false);

    async function handleSignOut() {
        try {
            await signOut(auth)
        } catch (error) {
            navigation.navigate("AlertModal", { title: "Ops!", text: error.code + ": " + error.message, type: "danger", icon: "warning-outline" })
        }
    }

    return (
        <Container>
            <Section>
                <SectionTitle>Interface do Usuário</SectionTitle>
                <SectionContent>
                    <OptionContainer>
                        <Tooltip text="Altera todo o visual para cores mais escuras e com menos saturação.">
                            <TextContainer>
                                <OptionIcon name="moon-outline" />
                                <Text>Tema Escuro</Text>
                            </TextContainer>
                        </Tooltip>
                        <Switch
                            value={theme.dark}
                            onValueChange={() => dispatch(switchTheme())}
                        />
                    </OptionContainer>

                    <OptionContainer>
                        <Tooltip text="Altera todo o visual para cores adaptadas.">
                            <TextContainer>
                                <OptionIcon name="contrast-outline" />
                                <Text>Modo Daltônico</Text>
                            </TextContainer>
                        </Tooltip>
                        <Switch
                            value={colorblindMode}
                            onValueChange={(value) => setColorblindMode(value)}
                        />
                    </OptionContainer>
                </SectionContent>
            </Section>

            <Section>
                <SectionTitle>Aplicativo</SectionTitle>
                <SectionContent>
                    <TouchableOpacity style={{ width: "100%" }} onPress={() => navigation.navigate("About")}>
                        <OptionContainer>
                            <TextContainer>
                                <OptionIcon name="information-circle-outline" />
                                <Text>Saiba Mais</Text>
                            </TextContainer>
                            <OptionIcon name="arrow-forward-outline" />
                        </OptionContainer>
                    </TouchableOpacity>

                    <Button type="danger" icon="log-out-outline" title="Sair da conta" onPress={() => handleSignOut()} />
                </SectionContent>
            </Section>
        </Container>
    )
}