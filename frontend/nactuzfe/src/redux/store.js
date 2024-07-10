import { createStore, combineReducers } from 'redux';
import userReducer from './reducers';

const rootReducer = combineReducers({
    user: userReducer,
    // other reducers can be added here
});

const store = createStore(rootReducer);

export default store;