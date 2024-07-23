import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LandingPage from './src/screens/LandingPage';
import { Provider } from 'react-redux';
import store from './src/redux/store';
import LoginPage from './src/screens/LoginPage';
import VerifyPhoneNumber from './src/screens/VerifyPhoneNumber';
import SignUpPage from './src/screens/SignUpPage';
import HomePage from './src/screens/HomePage';

const Stack = createNativeStackNavigator();

function App() {
    return (
        <Provider store={store}>
            <NavigationContainer>
                <Stack.Navigator initialRouteName="Home Page">
                    <Stack.Screen
                        name="Landing Page"
                        component={LandingPage}
                        options={{ headerShown: false }}
                    />
                    <Stack.Screen
                        name="Login Page"
                        component={LoginPage}
                        options={{ headerShown: false }}
                    />
                    <Stack.Screen
                        name="Verify OTP Page"
                        component={VerifyPhoneNumber}
                        options={{ headerShown: false }}
                    />
                    <Stack.Screen
                        name="Sign Up Page"
                        component={SignUpPage}
                        options={{ headerShown: false }}
                    />
                    <Stack.Screen
                        name="Home Page"
                        component={HomePage}
                        options={{ headerShown: false }}
                    />
                </Stack.Navigator>
            </NavigationContainer>
        </Provider>
    )
}

export default App;