import React, { useState } from 'react';
import Title from './Title';
import TitleList from './TitleList';

function App() {
  const [header, setHeader] = useState([
    {'title': 'About weather', 'text': 'The weather is so good in Moscow (no)'},
    {'title': 'In park', 'text': 'maniac..'},
    {'title': 'About college', 'text': 'There is a free water!'}
  ]);

  function handler() {
    header.pop();
    setHeader([...header]);
  }

  return (
    <div>
      <Title header={header}/>
      <p>H3 START</p>
      <TitleList header={header}/>
      <button onClick={handler}>del last</button>
    </div>
  );
}

export default App;
