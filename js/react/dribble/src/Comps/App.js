import React from 'react';
import {BrowserRouter as Router, Route, Routes} from 'react-router-dom';
import Header from './Header.js';
import About from './root-pages/About.js';
import NotFound from './root-pages/NotFound.js';
import Products from './root-pages/Products.js';
import Stories from './root-pages/Stories.js';
import Artists from './root-pages/Artists.js';
import Main from './Main.js';
import Awards from './Awards.js';

function App() {
  // const [theme, setTheme] = useState(themes.light)
  // const handler = () => {
    // setTheme((prevTheme)=> prevTheme === themes.light? themes.dark: themes.light)
  // } 
  return (
    <div className="App">
      <Header/>
      <Main/>
      <Awards/>
      
      <Router>
        <Routes>
          <Route path='/' element={<Header/>}/>
          <Route path='/about' element={<About/>}/>
          <Route path='/stories' element={<Stories/>}/>
          <Route path='/products' element={<Products/>}/>
          <Route path='/artists' element={<Artists/>}/>
          <Route path='*' element={<NotFound/>}/>
        </Routes>
      </Router>
    </div>
  );
}

export default App;
