import { createSlice } from '@reduxjs/toolkit';

const defState = [
  {id: 1, name: 'Велосипед', count: 5},
  {id: 2, name: 'Самокат', count: 3},
  {id: 3, name: 'Ролики', count: 7},
]

export const counterSlice = createSlice({
    name: 'items',
    initialState: defState,
    reducers: {
      increment: (items, action) => {
        items[action.payload].count += 1
      },
      decrement: (items, action) => {
        items[action.payload].count !== 0 ? items[action.payload].count -= 1 : console.log('no');
      },
      addProd: (items, action) => {
        items.push(action.payload);
      },
      deleteProd: (items, action) => {
        items.splice(action.payload, 1)
      }
    },
  })
  

export const { increment, decrement, addProd, deleteProd } = counterSlice.actions
export default counterSlice.reducer;