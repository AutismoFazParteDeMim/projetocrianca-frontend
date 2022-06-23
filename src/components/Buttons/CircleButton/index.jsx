import { Container, ContainerStatic, Icon } from "./styles"

export default function CircleButton({ icon, isStatic, ...props }) {
    if (isStatic) {
        return (
            <ContainerStatic {...props}>
                <Icon name={icon} />
            </ContainerStatic>
        )
    } else {
        return (
            <Container {...props}>
                <Icon name={icon} />
            </Container>
        )
    }
}