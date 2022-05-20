import BlockList from "./BLockList";
import { useContext } from "react";
import { ThemeContext, themes } from "../context/ThemeContext";

function Content() {
    const theme = useContext(ThemeContext)
    return (
      <div className="container2"
      style={{background: theme.background, color: theme.color, outline: theme.outline}}>
          Content
        <BlockList/>
      </div>
    );
  }
  
  export default Content;
  