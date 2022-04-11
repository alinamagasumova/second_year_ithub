import React from 'react'
import Article from "./Article";

function Articles () {
    const article = [
    {
        id: 1,
        title: 'Заголовок 1',
        text: 'Текст 1'
    },
    {
        id: 2,
        title: 'Заголовок 2',
        text: 'Текст 2'
    },
    {
        id: 3,
        title: 'Заголовок 3',
        text: 'Текст 3'
    },
    {
        id: 4,
        title: 'Заголовок 4',
        text: 'Текст 4'
    }
    ]
    return (
        <div>
            {article.map(article => 
            <Article title = {article.title} text = {article.text} id = {article.id}
            />)}
        </div>
    )
}

export default Articles;