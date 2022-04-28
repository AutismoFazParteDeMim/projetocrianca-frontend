import types from "./types"
import produce from "immer"

const INITIAL_STATE = {
    user: { logged: false },
    child: {}
}

export default function user(state = INITIAL_STATE, action) {
    switch (action.type) {
        case types.SET_USER:
            return produce(state, (draft) => {
                draft.user = { ...state.user, ...action.payload }
            })
        case types.SET_CHILD:
            return produce(state, (draft) => {
                draft.child = { ...state.child, ...action.payload }
            })
        case types.RESET:
            return produce(state, (draft) => {
                draft.user = INITIAL_STATE.user
                draft.child = INITIAL_STATE.child
            })
        default:
            return state
    }
}