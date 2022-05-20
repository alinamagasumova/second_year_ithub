import React from "react"

export const themes = {
    light: {
        background: '#F0F8FF',
        color: '#000000',
        outline: '1px solid #000000'
    },
    dark:  {
        background: '#000000',
        color: '#F0F8FF',
        outline: '1px solid #F0F8FF'
    }
}

export const ThemeContext = React.createContext(themes.light)