import React from 'react';
import { useDispatch, useSelector } from "react-redux";
import { increment, decrement, addProd, deleteProd } from './store/counterSlice';

function Products() {
    const items = useSelector((state) => state.product);
    const dispatch = useDispatch();
    const handleSubmit = (e) => {
        e.preventDefault();
        let newItem = {
            id: Date.now(),
            name: e.target.item.value,
            count: 0
        }
        dispatch(addProd(newItem))
    }

    return (
        <div>
            <form onSubmit={handleSubmit}>
                <input type='text' name='item' placeHolder='Введите новый товар' required></input>
                <button type='submit'>Подтвердить</button>
            </form>
            {items.map((item, index)=>(
                <div className='itemContainer' key={item.id}>
                    <p onDoubleClick={() => dispatch(deleteProd(index))}>{item.name}: {item.count}</p>
                    <button onClick={() => dispatch(increment(index))}>+</button>
                    <button onClick={() => dispatch(decrement(index))}>-</button>
                </div>
            ))}

        </div>
    )
}

export default Products;