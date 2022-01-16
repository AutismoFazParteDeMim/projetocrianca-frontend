import React from 'react'
import { Image, Descrição, Item, Container, Title } from './styles'

import Slider from '../../../components/Slider'
import data from "./data"

export default function Expressions({ navigation }) {
    const RenderItem = ({ item }) => (
        <Item>
            <Image source={item.image} />
            <Title>{item.title}</Title>
            <Descrição>{item.text}</Descrição>
        </Item>
    )

    return (
        <Container>
            <Slider navigation={navigation} data={data} renderItem={RenderItem} />
        </Container>
    )
}