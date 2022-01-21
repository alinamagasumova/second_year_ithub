import React from 'react';
import Articles from './Articles.js'

function App() {
    return (
        <div>
            <h1 className='main'>Hello world!</h1>
            <Articles title='Лежачий Тигр'></Articles>
            <Articles title='Голодный Тигр'></Articles>
            <Articles title='Спящий Тигр'></Articles>
        </div>
    )
}

export default App;