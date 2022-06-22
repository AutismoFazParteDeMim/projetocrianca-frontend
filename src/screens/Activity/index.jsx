import { VerticalList } from "../../components"

import { Container } from "./styles"

export default function Activities({ navigation }) {
    const data = [
        {
            key: 1,
            title: "Rotinas",
            description: "Trabalha estabelecer a relação do numero com a quantidade e percepção visual, etc.",
            image: require("../../../assets/icons/routines-icon.png"),
            onPress: () => navigation.navigate("Routines")
        },
        {
            key: 2,
            title: "Expressões",
            description: "Trabalha estabelecer a relação do numero com a quantidade, percepção visual, etc.",
            image: require("../../../assets/icons/expressions-icon.png"),
            onPress: () => navigation.navigate("Expressions")
        }
    ]

    return (
        <Container>
            <VerticalList data={data} />
        </Container>
    )
}