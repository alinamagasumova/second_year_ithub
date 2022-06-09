import { useState } from "react";
import { themes, ThemeContext } from "../context/ThemeContext";
import Content from "./Content";


function App() {
  const [theme, setTheme] = useState(themes.light)
  const handler = () => {
    setTheme((prevTheme)=> prevTheme === themes.light? themes.dark: themes.light)
  } 

  return (
    <div className="container1">
      App
      <ThemeContext.Provider value = {theme}>
      <Content/>
      </ThemeContext.Provider>
        <div>
          <button onClick={()=> handler()}>Клац</button>
        </div>
    </div>
  );
}

export default App;
