import { createSlice } from '@reduxjs/toolkit';

const initialState = {
    phoneNumber: '',
};

const phoneSlice = createSlice({
    name: 'phone',
    initialState,
    reducers: {
        setPhoneNumber: (state, action) => {
            state.phoneNumber = action.payload;
        },
    },
});

export const { setPhoneNumber } = phoneSlice.actions;

export default phoneSlice.reducer;
