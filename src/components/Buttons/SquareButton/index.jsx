import { Container, Image, Title } from "./styles"

export default function SquareButton({image, title, ...props}) {
    return (
        <Container {...props}>
            <Image source={image} />
            <Title>{title}</Title>
        </Container>
    )
}