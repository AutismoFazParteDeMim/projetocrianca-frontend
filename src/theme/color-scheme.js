import { DarkTheme, DefaultTheme } from "@react-navigation/native"
import { useColorScheme } from "react-native"

const lightTheme = {
    ...DefaultTheme,
    colors: {
        ...DefaultTheme.colors,
        primary: "#00A7DF",
        primaryShadow: "#0093C4",
        secondary: "#3498DB",
        secondaryShadow: "#1F74AD",

        success: "#25D366",
        successShadow: "#1EAE54",
        warning: "#FCC936",
        warningShadow: "#C99603",
        danger: "#EA4335",
        dangerShadow: "#B92013",

        inputBackground: "#E5E5E5",
        inputBackgroundShadow: "#979797",

        text: "#3D3D3D",
        textAlt: "#fff",

        shadow: "#e5e5e5",

        background: "#FFFFFF",
    }
}

const darkTheme = {
    ...DarkTheme,
    colors: {
        ...DarkTheme.colors,
        primary: "#71BA51",
        primaryShadow: "#3C7D1F",

        success: "#25D366",
        successShadow: "#1EAE54",
        warning: "#FCC936",
        warningShadow: "#C99603",
        danger: "#EA4335",
        dangerShadow: "#B92013",

        inputBackground: "#E5E5E5",
        inputBackgroundShadow: "#979797",

        text: "#ffffff",
        textAltLight: "#fff",
        textAltDark: "#3b3b3b",

        shadow: "#e5e5e5",

        background: "#3E4651",
    }
}

export default function colorScheme() {
    const colorscheme = useColorScheme()

    if (colorscheme === "light" || colorscheme === "no-preference") {
        return lightTheme
    } else {
        return darkTheme
    }
}