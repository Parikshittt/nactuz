import { configureStore } from '@reduxjs/toolkit';
import phoneReducer from './phoneSlice';

export const store = configureStore({
    reducer: {
        phone: phoneReducer,
    },
});

export default store;