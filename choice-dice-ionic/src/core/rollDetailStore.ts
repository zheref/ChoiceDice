import takeRandomOptionFrom from "../domain/takeRandomOptionFrom";
import { Dice } from "./rollSlice";

interface RollDetailState {
    dice?: Dice;
    randomPick?: string;
}

interface RollDetailAction {
    type: string;
    payload?: any;
}

// Action creator
export function setDice(dice: Dice): RollDetailAction {
    return { type: 'SET_DICE', payload: dice };
}

export function started(): RollDetailAction {
    return { type: 'STARTED' };
}

export function userTappedRegenerate(): RollDetailAction {
    return { type: 'USER_TAPPED_REGENERATE' };
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
        case 'STARTED':
            return {
                ...state,
                randomPick: takeRandomOptionFrom(state.dice?.options as string[])
            }
        case 'USER_TAPPED_REGENERATE':
            return {
                ...state,
                randomPick: takeRandomOptionFrom(state.dice?.options as string[])
            }
        default:
            return initialState;
    }
}