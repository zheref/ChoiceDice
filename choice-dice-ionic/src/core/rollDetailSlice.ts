import { PayloadAction, createSlice } from "@reduxjs/toolkit";
import { Dice } from "./rollSlice";

interface RollDetailState {
    dice?: Dice;
}

const rollDetailSlice = createSlice({
    name: 'rollDetail',
    initialState: { dice: undefined } as RollDetailState,
    reducers: {
        setDice: (state: RollDetailState, action: PayloadAction<Dice>) => {
            state.dice = action.payload;
        }
    }
});

export const { setDice } = rollDetailSlice.actions;
export const rollDetailReducer = rollDetailSlice.reducer;