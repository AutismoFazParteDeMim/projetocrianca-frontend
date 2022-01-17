import React, { useState } from "react"
import { Switch } from 'react-native-elements'
import { Container, OptionContainer, OptionIcon, Section, SectionTitle, TextContainer } from "./styles"
import Text from "../../components/Text"
import Tooltip from "../../components/Tooltip"
import { TouchableOpacity } from "react-native"

export default function Settings() {
    const [darkMode, setDarkMode] = useState(false);
    const [colorblindMode, setColorblindMode] = useState(false);


    const toggleSwitch = () => {
        setChecked(!checked);
    };

    return (
        <Container>
            <Section>
                <SectionTitle>Interface do Usuário</SectionTitle>
                <Tooltip text="Altera todo o visual para cores mais escuras e com menos saturação.">
                    <OptionContainer>
                        <TextContainer>
                            <OptionIcon name="moon-outline" />
                            <Text>Tema Escuro</Text>
                        </TextContainer>
                        <Switch
                            value={darkMode}
                            onValueChange={(value) => setDarkMode(value)}
                        />
                    </OptionContainer>
                </Tooltip>
                <Tooltip text="Altera todo o visual para cores adaptadas.">
                    <OptionContainer>
                        <TextContainer>
                            <OptionIcon name="contrast-outline" />
                            <Text>Modo Daltônico</Text>
                        </TextContainer>
                        <Switch
                            value={colorblindMode}
                            onValueChange={(value) => setColorblindMode(value)}
                        />
                    </OptionContainer>
                </Tooltip>
            </Section>

            <Section>
                <SectionTitle>Aplicativo</SectionTitle>
                <TouchableOpacity>
                    <OptionContainer>
                        <TextContainer>
                            <OptionIcon name="information-circle-outline" />
                            <Text>Saiba Mais</Text>
                        </TextContainer>
                        <OptionIcon name="arrow-forward-outline" />
                    </OptionContainer>
                </TouchableOpacity>
            </Section>
        </Container>
    )
}