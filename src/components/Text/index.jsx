import { CustomText } from "./styles"

export default function Text({ children, ...props }) {
    return (
        <CustomText {...props}>
            {children}
        </CustomText>
    )
}