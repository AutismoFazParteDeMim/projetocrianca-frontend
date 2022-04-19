import { createStore, applyMiddleware, compose } from "redux"
import rootReducer from "./modules/rootReducer"

const store = createStore(rootReducer)

export default store