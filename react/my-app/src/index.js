import React from 'react';
import ReactDOM from 'react-dom';
// import App from './components/App';

// const content = {
//     name: 'Текст'
// }
// const arr = ["Саша", "Катя", "Слава", "Миша"]

// let array = arr.map(i => <div><h1>{i}</h1></div>)

// const element = (
//     <div>
//         <h1>{content.name}</h1>
//     </div>
// )

const content = [
  ['0', 'Саша'],
  ['1', 'Петя'],
  ['1', 'Катя'],
  ['0', 'Миша']
]

// let arr = []
// for (let [key, el] of content) {
//     if (key === 0) {
//         arr.push(<div className='main'>{el}</div>)
//     } else {
//         arr.push(<b>{el}</b>)
//     }
// }

let newContent = content.map(elem => {
  if(elem[0] === "0") {
     return <div className='main'>{elem[1]}</div>
  } else if (elem[0] === "1"){
  return (<div><b>{elem[1]}</b></div>)
  }
})

ReactDOM.render(
  // <App />,
  newContent,
  document.getElementById('root')
);