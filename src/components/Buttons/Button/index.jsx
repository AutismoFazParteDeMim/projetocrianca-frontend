import { ButtonIcon, ButtonTitle, Container } from "./style"

export default function Button({ icon, type, textColor, title, ...props }) {
    return (
        <Container type={type} {...props}>
            <ButtonIcon name={icon} type={type} textColor={textColor} />
            <ButtonTitle type={type} textColor={textColor}>{title}</ButtonTitle>
        </Container>
    )
}