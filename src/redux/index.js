import { createStore, applyMiddleware } from "redux"
import thunk from "redux-thunk"
import reducers from "./modules/reducers"
import { persistStore, persistReducer } from "redux-persist"
import AsyncStorage from "@react-native-async-storage/async-storage"

const persistConfig = {
    key: 'settings',
    storage: AsyncStorage
}

const persistedReducer = persistReducer(persistConfig, reducers)
const store = createStore(persistedReducer, applyMiddleware(thunk))
const persistor = persistStore(store)

export { store, persistor }