import types from "./types"
import produce from "immer"
import getTheme from "../../../theme"

const INITIAL_STATE = {
    firstTime: true,
    theme: getTheme()
}

export default function settings(state = INITIAL_STATE, action) {
    switch (action.type) {
        case types.FIRST_TIME:
            return produce(state, (draft) => {
                draft.firstTime = action.payload
            })
        case types.THEME_SWITCH:
            return produce(state, (draft) => {
                state.theme.dark ? draft.theme = getTheme(false) : draft.theme = getTheme(true)
            })
        case types.RESET:
            return produce(state, (draft) => {
                draft.theme = INITIAL_STATE.theme
            })
        default:
            return state
    }
}