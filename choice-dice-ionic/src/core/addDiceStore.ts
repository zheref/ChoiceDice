
interface AddDiceState {
    name: string;
    options: string[];
}

interface Action {
    type: string;
    payload?: any;
}

// Action creators
export function setName(name: string): Action {
    return { type: 'SET_NAME', payload: name };
}

export function addOption(option: string): Action {
    return { type: 'ADD_OPTION', payload: option };
}

const initialState: AddDiceState = {
    name: '',
    options: []
}

// Reducer
export function addDiceReducer(state: AddDiceState = initialState, action: Action): AddDiceState {
    switch (action.type) {
        case 'SET_NAME':
            return {
                ...state,
                name: action.payload,
            }
        case 'ADD_OPTION':
            return {
                ...state,
                options: [
                    ...state.options,
                    action.payload,
                ]
            }
        default:
            return state;
    }
}