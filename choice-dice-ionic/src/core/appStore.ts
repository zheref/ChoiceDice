import { configureStore } from "@reduxjs/toolkit";
import { rollReducer } from "./rollSlice";
import { rollDetailReducer } from "./rollDetailStore";
import { addDiceReducer } from "./addDiceStore";

export const appStore = configureStore({
    reducer: {
        roll: rollReducer,
        rollDetail: rollDetailReducer,
        addDice: addDiceReducer
    }
})

export type RootState = ReturnType<typeof appStore.getState>