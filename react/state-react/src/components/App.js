import React from "react";
// class App extends React.Component {
//     constructor(props) {
//         super(props);
//         this.state = {
//             count: 0
//         }
//         this.incremental = this.incremental.bind(this)
//         this.dicremental = this.dicremental.bind(this)
//     }

//     incremental = () => this.setState(({count}) => {return {count: count + 1}})
//     dicremental = () => this.setState(({count}) => {return {count: count - 1}})
    //     // this.state.count++;
    //     console.log(this.state.count)

function App(){
    const [elem, setElem] = useState([0])
    let a = []
    function cnt(e) {
        for(let i = 0; i < e.target.value; i++) {
            a.push(i)
            setElem([...a])
        }
        // console.log(elem)
    }
    return(
        <div>
            <input onChange={cnt}></input>
            {elem.map(()=> <Div/>)}
        </div>
    )
}
    // }
//     render() {
//         return(
//             <div>
//                 <p>{this.state.count}</p>
//                 <button onClick={this.incremental}>Incr!</button>
//                 <button onClick={this.dicremental}>Decr!</button>
//                 <p>{Date.now().toLocaleString()}</p>
//             </div>
//         )
//     }
// }

export default App;