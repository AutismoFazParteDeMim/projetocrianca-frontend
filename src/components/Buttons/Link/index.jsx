import { TouchableOpacity } from "react-native"
import { LinkText } from "./style"

export default function Link({ title, onPress, ...props }) {
    return (
        <TouchableOpacity onPress={onPress} {...props}>
            <LinkText>{title}</LinkText>
        </TouchableOpacity>
    )
}