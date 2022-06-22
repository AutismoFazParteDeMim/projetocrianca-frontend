import { Slider } from "../../components"

import { Container, Item, Image, Descrição, CustomHeader } from "./styles"

export default function Tutorial({ navigation, route }) {
    const { data } = route.params
    const RenderItem = ({ item }) => (
        <Item>
            <Image source={item.image} />
            <Descrição>{item.text}</Descrição>
        </Item>
    )

    return (
        <>
            <CustomHeader title="Tutorial" navigation={navigation} />
            <Container>
                <Slider navigation={navigation} data={data} renderItem={RenderItem} />
            </Container>
        </>
    )
}