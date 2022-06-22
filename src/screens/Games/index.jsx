import { VerticalList } from "../../components"
import { Container } from "./styles"

export default function Games({ navigation }) {
    const dataa = [
        {
            key: 1,
            title: "Jogo da Memória",
            description: "Trabalha estabelecer a relação do numero com a quantidade e percepção visual, etc.",
            image: require("../../../assets/icons/jogodamemoria-icon.png"),
            onPress: () => navigation.navigate("MemoryGame")
        }
    ]

    return (
        <Container>
            <VerticalList data={dataa} />
        </Container>
    )
}