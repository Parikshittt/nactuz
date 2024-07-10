import React, { useState } from "react";
import { StyleSheet, Text, TextInput, TouchableOpacity, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import OnboardingFooter from "../components/onboardingFooter";
import { useNavigation } from "@react-navigation/native";
import { useDispatch, useSelector } from "react-redux";
import { setPhoneNumber as setPhoneNumberAction } from "../redux/phoneSlice";


function LoginPage() {
    const dispatch = useDispatch();
    const [phoneNumber, setPhoneNumber] = useState('');
    const [buttonOpacity, setButtonOpacity] = useState(0.5)
    const navigation = useNavigation();
    const defaultPhoneNumber = useSelector((state) => state.phone.phoneNumber)

    const handlePhoneNumberChange = (text) => {
        const formattedPhoneNumber = text.replace(/[^0-9]/g, '');
        setPhoneNumber(formattedPhoneNumber);
        if (formattedPhoneNumber.length === 10) {
            setButtonOpacity(1);
        } else {
            setButtonOpacity(0.5);
        }
    };

    function handleSendOtpOnLoginPage() {
        // API1 -> POST API to check if phone number is a current user or not 
        if (phoneNumber == '1234567899') {
            navigation.navigate('Verify OTP Page')
        } else {
            dispatch(setPhoneNumberAction(phoneNumber));
            navigation.navigate('Sign Up Page')
            // navigation.navigate('Sign Up Page')
        }
    }

    //CSS Below This, Dont move this please
    const styles = StyleSheet.create({
        LandingPageMaster: {
            flex: 1,
            backgroundColor: theme.darkColor,
            justifyContent: "flex-end",
        },
        loginSignUpJourneyCard: {
            backgroundColor: theme.lightColor,
            width: '100%',
            padding: 15,
            paddingTop: 30,
            gap: 30,
        },
        Header: {
            flexDirection: 'column'
        },
        headerHeader: {
            marginVertical: 0,
            fontFamily: Fonts.interBold16.fontFamily,
            fontSize: Fonts.interBold16.fontSize,
            color: theme.mainText,
        },
        headerTag: {
            marginVertical: 0,
            fontFamily: Fonts.interMedium12.fontFamily,
            fontSize: Fonts.interMedium12.fontSize,
            color: theme.greyText,
        },
        sendOtpButton: {
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: 48,
            width: '100%',
            backgroundColor: theme.brandColor,
            borderRadius: 5,
            opacity: buttonOpacity
        },
        sendOtpText: {
            fontFamily: Fonts.interBold16.fontFamily,
            fontSize: Fonts.interBold16.fontSize,
            margin: 0,
            color: theme.buttonText
        },
        loginDisclaimer: {
            fontFamily: Fonts.interMedium12.fontFamily,
            fontSize: 10,
            color: theme.greyText,
            textAlign: 'center',
            margin: 0
        },
        inputHeader: {
            fontFamily: Fonts.interMedium12.fontFamily,
            fontSize: Fonts.interMedium12.fontSize,
            color: theme.greyText
        },
        inputClass: {
            width: '90%',
            color: theme.mainText,
            fontFamily: Fonts.interMedium16.fontFamily,
            fontSize: Fonts.interBold16.fontSize,
            height: '100%',
            padding: 0
        },
        countryCodeText: {
            color: theme.mainText,
            fontFamily: Fonts.interMedium16.fontFamily,
            fontSize: Fonts.interBold16.fontSize,
            color: theme.brandColor,
        },
        inputNumberContainer: {
            display: 'flex',
            flexDirection: 'row',
            height: 40,
            justifyContent: 'space-between',
            alignItems: 'center',
            borderBottomWidth: 2,
            borderBottomColor: theme.brandColor
        }

    })
    //CSS Above This, Dont move this please
    return (
        <SafeAreaView style={styles.LandingPageMaster}>
            <View style={styles.loginSignUpJourneyCard}>
                <View style={styles.Header}>
                    <Text style={styles.headerHeader}>Welcome Back!</Text>
                    <Text style={styles.headerTag}>We missed you a lot ♥</Text>
                </View>
                <View>
                    <Text style={styles.inputHeader} >10 digit mobile number</Text>
                    <View style={styles.inputNumberContainer}>
                        <Text style={styles.countryCodeText}>+91</Text>
                        <TextInput
                            style={styles.inputClass}
                            keyboardType="numeric"
                            value={phoneNumber}
                            maxLength={10}
                            onChangeText={handlePhoneNumberChange}></TextInput>
                    </View>
                </View>
                <View>
                    <TouchableOpacity disabled={phoneNumber.length < 10} onPress={handleSendOtpOnLoginPage}>
                        <View style={styles.sendOtpButton}>
                            <Text style={styles.sendOtpText}>SEND OTP</Text>
                        </View>
                    </TouchableOpacity>
                    <Text style={styles.loginDisclaimer}>If the number is un-registered then you’ll be sent to the sign up page</Text>
                </View>
                <OnboardingFooter />
            </View>
        </SafeAreaView>
    )


}

export default LoginPage;

