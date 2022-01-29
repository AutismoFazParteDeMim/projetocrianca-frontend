import React, { useState } from "react"

import { Button, Container, Icon, Input, ButtonIcon } from "./styles.js"

export default function TextInput(props) {
    const [passVisibility, setPassVisibility] = useState({ icon: "eye-outline", hidePassword: true })

    function showPass() {
        if (passVisibility.hidePassword === true) {
            setPassVisibility({ icon: "eye-off-outline", hidePassword: false })
        } else {
            setPassVisibility({ icon: "eye-outline", hidePassword: true })
        }
    }

    return (
        <Container>
            {props.icon && <Icon name={props.icon} />}
            {
                props.type === "password"
                    ?
                    <Input {...props} autoCorrect={false} autoComplete="password" autoCapitalize="none" secureTextEntry={passVisibility.hidePassword} />
                    : props.type === "email"
                        ? <Input {...props} autoCorrect={false} autoComplete="email" autoCapitalize="none" keyboardType="email-address" />
                        : <Input {...props} />
            }
            {
                props.type === "password" &&
                <Button onPress={() => showPass()}>
                    <ButtonIcon name={passVisibility.icon} />
                </Button>
            }
        </Container>
    )
}