import { PayloadAction, createSlice } from "@reduxjs/toolkit";

interface Dice {
    id: number;
    name: string;
    options: string[];
}
export interface RollState {
    dices: Dice[];
}

const exampleDices: Dice[] = [
    { id: 1, name: 'Cardio Today', options: ['Elliptical', 'Bike', 'Swimming Pool', 'Park Walk'] },
    { id: 2, name: 'Dinner', options: ['Tuna Avocado', 'Alejandria Salad', 'Tortilla Pizza', 'Benedict Eggs'] },
    { id: 3, name: 'Movie', options: ['The Godfather', 'The Matrix', 'The Lord of the Rings', 'The Shawshank Redemption'] },
    { id: 4, name: 'Game', options: ['Chess', 'Monopoly', 'Poker', 'Dungeons & Dragons'] },
    { id: 5, name: 'Workout', options: ['Push Ups', 'Pull Ups', 'Squats', 'Lunges'] },
    { id: 6, name: 'Dessert', options: ['Ice Cream', 'Chocolate Cake', 'Brownie', 'Cheesecake'] }
  ]

export const rollSlice = createSlice({
    name: 'roll',
    initialState: { dices: exampleDices } as RollState,
    reducers: {
        deleteDice: (state: RollState, action: PayloadAction<number>) => {
            state.dices = state.dices.filter(dice => dice.id !== action.payload);
        }
    }
});

export const { deleteDice } = rollSlice.actions;
export const rollReducer = rollSlice.reducer;