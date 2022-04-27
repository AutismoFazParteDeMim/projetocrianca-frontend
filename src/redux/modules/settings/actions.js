import types from "./types"

export function firstTime(payload) {
    return { type: types.FIRST_TIME, payload: payload }
}

export function switchTheme() {
    return { type: types.THEME_SWITCH }
}

export function reset() {
    return { type: types.RESET }
}