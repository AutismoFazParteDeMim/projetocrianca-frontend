import { ButtonIcon, ButtonTitle, Container } from "./style"

export default function Button({ icon, type, title, onPress, backgroundColor, borderColor, textColor, ...props }) {
    return (
        <Container
            type={type}
            backgroundColor={backgroundColor}
            borderColor={borderColor}
            onPress={onPress}
            {...props}
        >
            <ButtonIcon name={icon} type={type} textColor={textColor} />
            <ButtonTitle type={type} textColor={textColor}>{title}</ButtonTitle>
        </Container>
    )
}