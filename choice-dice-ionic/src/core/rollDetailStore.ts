import { Dice } from "./rollSlice";

interface RollDetailState {
    dice?: Dice;
}

interface RollDetailAction {
    type: string;
    payload?: any;
}

// Action creator
export function setDice(dice: Dice): RollDetailAction {
    return { type: 'SET_DICE', payload: dice };
}

const initialState: RollDetailState = {
    dice: undefined
};

export function rollDetailReducer(state: RollDetailState = initialState, action: RollDetailAction): RollDetailState {
    switch (action.type) {
        case 'SET_DICE':
            return {
                ...state,
                dice: action.payload as Dice
            };
        default:
            return initialState;
    }
}