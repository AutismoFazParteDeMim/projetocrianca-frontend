import types from "./types"
import produce from "immer"
import { darkTheme, lightTheme } from "../../../theme/color-scheme"

const INITIAL_STATE = {
    theme: lightTheme
}

export default function settings(state = INITIAL_STATE, action) {
    switch (action.type) {
        case types.THEME_SWITCH:
            return produce(state, (draft) => {
                state.theme.dark ? draft.theme = lightTheme : draft.theme = darkTheme
            })
        default:
            return state
    }
}