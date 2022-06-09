import React from "react"

export const themes = {
    light: {
        background: 'rgb(239, 226, 227)',
        color: 'rgb(32, 32, 32)',
        header_color: 'rgb(32, 32, 32)',
    },
    dark:  {
        background: '#545050',
        color: 'rgb(239, 226, 227)',
        header_color: 'rgb(239, 226, 227)',
    }
}

export const ThemeContext = React.createContext(themes.light)