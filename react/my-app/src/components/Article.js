import React from 'react';
import './main.css'

function Article(props) {
    const {title} = props;
    return (
        <div className='main'>
            <h1>{title}</h1>
        </div>
    )
}

export default Article;