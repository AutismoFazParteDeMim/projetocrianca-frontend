import React from "react";

import Back from "./Back";
import DefaultButton from "./Default";

function Button(props) {
    if (props.type == "back") {
        return (
            <Back />
        )
    } else {
        return (
            <DefaultButton type={props.type} icon={props.icon} text={props.text} />
        )
    }
}

export default Button