import types from "./types"
import produce from "immer"
import { darkTheme, lightTheme } from "../../../theme/color-scheme"

const INITIAL_STATE = {
    firstTime: true,
    theme: lightTheme
}

export default function settings(state = INITIAL_STATE, action) {
    switch (action.type) {
        case types.FIRST_TIME:
            return produce(state, (draft) => {
                draft.firstTime = action.payload
            })
        case types.THEME_SWITCH:
            return produce(state, (draft) => {
                state.theme.dark ? draft.theme = lightTheme : draft.theme = darkTheme
            })
        case types.RESET:
            return produce(state, (draft) => {
                draft.theme = INITIAL_STATE.theme
            })
        default:
            return state
    }
}