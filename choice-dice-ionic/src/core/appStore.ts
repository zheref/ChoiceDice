import { configureStore } from "@reduxjs/toolkit";
import { rollReducer } from "./rollStore";

export const appStore = configureStore({
    reducer: {
        roll: rollReducer
    }
})

export type RootState = ReturnType<typeof appStore.getState>