import types from "./types"

export function setUserAction(payload) {
    return { type: types.SET_USER, payload: payload }
}

export function setChildAction(payload) {
    return { type: types.SET_CHILD, payload: payload }
}

export function resetAction() {
    return { type: types.RESET }
}