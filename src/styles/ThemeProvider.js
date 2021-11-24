import React, { useState, createContext, useEffect } from "react"

const ThemeContext = createContext({})

import { light, dark } from "./colors"


const ThemeProvider = ({ children }) => {
    const [theme, setTheme] = useState("light")
    const [colors, setColors] = useState(light)

    function setDarkMode() {
        if (theme === "light") {
            setTheme("dark")
            setColors(dark)
        } else {
            setTheme("light")
            setColors(light)
        }
    }

    return (
        <ThemeContext.Provider value={{ theme, colors, setDarkMode }}>
            {children}
        </ThemeContext.Provider>
    )
}

export { ThemeContext, ThemeProvider }