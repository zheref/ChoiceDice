import { configureStore } from "@reduxjs/toolkit";
import { rollReducer } from "./rollSlice";
import { rollDetailReducer } from "./rollDetailStore";

export const appStore = configureStore({
    reducer: {
        roll: rollReducer,
        rollDetail: rollDetailReducer
    }
})

export type RootState = ReturnType<typeof appStore.getState>