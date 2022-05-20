import { useContext } from "react";
import { ThemeContext } from "../context/ThemeContext";


function Block() {
    const theme = useContext(ThemeContext)
    return (
      <div className="container4"
      style={{background: theme.background, color: theme.color, outline: theme.outline}}>
        Block
      </div>
    );
  }
  
  export default Block;
  