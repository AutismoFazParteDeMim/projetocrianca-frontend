import React from "react"
import VerticalList from "../../components/Lists/VerticalList"
import { Container } from "./styles"

export default function Activities({ navigation }) {
    const dataa = [
        {
            key: 1,
            title: "Rotinas",
            description: "Trabalha estabelecer a relação do numero com a quantidade, percepção visual, etc.",
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
            <VerticalList data={dataa} />
        </Container>
    )
}