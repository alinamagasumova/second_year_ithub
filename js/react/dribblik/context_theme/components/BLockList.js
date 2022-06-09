import Block from "./Block";
import { useContext } from "react";
import { ThemeContext, themes } from "../context/ThemeContext";

function BlockList() {
    const theme = useContext(ThemeContext)
    return (
      <div className="container3"
      style={{background: theme.background, color: theme.color, outline: theme.outline}}>
          BlockList
        <Block/>
      </div>
    );
  }
  
  export default BlockList;
  