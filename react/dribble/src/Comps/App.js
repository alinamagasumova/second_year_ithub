import React from 'react';
import {BrowserRouter as Router, Route, Routes} from 'react-router-dom';
import Header from './Header.js';
import Home from './Home.js';
import About from './About.js';
import NotFound from './NotFound.js';

function App() {
  return (
    <div className="App">
      <Header/>
      <Router>
        <Routes>
          <Route path='/' element={<Home/>}/>
          <Route path='/about' element={<About/>}/>
          {/* <Route path='/about' element={<App/>}/> */}
          <Route path='*' element={<NotFound/>}/>
        </Routes>
      </Router>
    </div>
  );
}

export default App;
