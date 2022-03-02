import {BrowserRouter as Router, Route, Routes} from 'react-router-dom';
import React from 'react';
import Articles from './Articles';
import Home from './Home';
import About from './About';
import NotFound from './NotFound';

function App() {
    return (
        <div>
            <nav>
                <a href='/'>Home</a>
                <a href='/about'>About</a>
            </nav>
            <Router>
                <Routes>
                    <Route path='/' element={<Home/>}></Route>
                    <Route path='/about' element={<About/>}></Route>
                    <Route path='*' element={<NotFound/>}></Route>
                </Routes>
            </Router>
            <Articles/>
        </div>
    )
}

export default App;