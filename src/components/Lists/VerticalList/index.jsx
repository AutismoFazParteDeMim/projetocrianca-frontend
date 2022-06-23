import { FlatList } from "react-native"
import Text from "../../Text"

import { Item, Image, Title, Icon, LeftSide, TextContainer } from "./styles"

export default function VerticalList({ data, ...props }) {
    const RenderItem = ({ item }) => (
        <Item onPress={item.onPress}>
            <LeftSide>
                <Image source={item.image} />
                <TextContainer>
                    <Title>{item.title}</Title>
                    <Text numberOfLines={3} ellipsizeMode="tail">{item.description}</Text>
                </TextContainer>
            </LeftSide>
            <Icon name="arrow-forward" />
        </Item>
    )

    return (
        <FlatList
            data={data}
            renderItem={RenderItem}
            keyExtractor={item => item.key}
            {...props}
        />
    )
}