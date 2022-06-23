import { DarkTheme, DefaultTheme } from "@react-navigation/native"

export const lightTheme = {
    ...DefaultTheme,
    dark: false,
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

        card: "#E5E5E5",
        cardShadow: "#979797",

        text: "#3D3D3D",
        textAltLight: "#ffffff",
        textAltDark: "#3b3b3b",

        shadow: "#e5e5e5",

        background: "#FFFFFF",
        backdropColor: "rgba(0, 0, 0, 0.6)",
    }
}

export const darkTheme = {
    ...DarkTheme,
    dark: true,
    colors: {
        ...DarkTheme.colors,
        primary: "#71BA51",
        primaryShadow: "#3C7D1F",
        secondary: "#e5e5e533",
        secondaryShadow: "#979797",

        success: "#25D366",
        successShadow: "#1EAE54",
        warning: "#FCC936",
        warningShadow: "#C99603",
        danger: "#EA4335",
        dangerShadow: "#B92013",

        card: "#60666F",
        cardShadow: "#979797",

        text: "#ffffff",
        textAltLight: "#ffffff",
        textAltDark: "#3b3b3b",

        shadow: "#e5e5e5",

        background: "#3E4651",
        backdropColor: "rgba(0, 0, 0, 0.6)",
    }
}