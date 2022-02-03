import React from "react"

import { Container, Icon, Picker as RNPicker } from "./styles.js"

export default function Picker(props) {
    return (
        <Container>
            <Icon name={props.icon} />
            <RNPicker
                {...props}
            >
                {props.children}
            </RNPicker>
        </Container>
    )
}