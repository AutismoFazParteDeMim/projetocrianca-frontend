import React, { useState, createContext } from "react"

export const AuthenticatedUserContext = createContext({})

export const AuthenticatedUserProvider = ({ children }) => {
    const [user, setUser] = useState(null)
    const [child, setChild] = useState(null)

    return (
        <AuthenticatedUserContext.Provider value={{ user, setUser, child, setChild }}>
            {children}
        </AuthenticatedUserContext.Provider>
    )
}