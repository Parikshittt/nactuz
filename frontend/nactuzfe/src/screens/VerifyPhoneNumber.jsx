import React, { useEffect } from "react";
import { SafeAreaView, StyleSheet, Text, TextInput, View } from "react-native";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import { useState } from "react";
import { Dimensions } from 'react-native';
import { useNavigation, useRoute } from "@react-navigation/native";
import { TouchableOpacity } from "react-native";
import OnboardingFooter from "../components/onboardingFooter";

function VerifyPhoneNumber() {
    const [otp, setOTP] = useState('');
    const [buttonOpacity, setButtonOpacity] = useState(0.5)
    const navigation = useNavigation();
    const [secondsLeft, setSecondsLeft] = useState(30);
    const [showResend, setShowResend] = useState(false);
    const route = useRoute();
    const { fakeOTP } = route.params;

    useEffect(() => {
        let intervalId;

        if (secondsLeft > 0) {
            intervalId = setInterval(() => {
                setSecondsLeft((prevSeconds) => prevSeconds - 1);
            }, 1000);
        } else {
            setShowResend(true);
        }

        return () => clearInterval(intervalId);
    }, [secondsLeft]);

    const handleResend = () => {
        if (showResend) {
            setSecondsLeft(30); // Reset the countdown timer
            setShowResend(false); // Show the countdown again
        }
        console.log('Here is the OTP ->', fakeOTP)
    };

    const containerWidth = (Dimensions.get('window').width - 96) // Adjust as per your layout

    // Calculate letter spacing dynamically
    const letterSpacing = (containerWidth - 10 * 6) / 5;

    const handleTextChange = (text) => {
        // Remove non-numeric characters
        const numericText = text.replace(/[^0-9]/g, '');
        setOTP(numericText);
        if (numericText.length === 6) {
            setButtonOpacity(1);
        } else {
            setButtonOpacity(0.5);
        }

    };

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
        },
        borderStyleBase: {
            width: 30,
            height: 45
        },

        borderStyleHighLighted: {
            borderColor: "#03DAC6",
        },

        underlineStyleBase: {
            width: 30,
            height: 45,
            borderWidth: 0,
            borderBottomWidth: 1,
        },

        underlineStyleHighLighted: {
            borderColor: "#03DAC6",
        },
        OtpInputContainer: {
            borderColor: theme.brandColor,
            borderWidth: 2,
            width: 'fit-content',
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            padding: 0,
            height: 56,
            borderRadius: 10
        },
        input: {
            height: '100%',
            width: '100%',
            fontSize: 16,
            textAlign: 'left',
            letterSpacing: letterSpacing,
            color: theme.mainText,
            margin: 0
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
        resendOtpText: {
            fontFamily: showResend ? Fonts.interBold12.fontFamily : Fonts.interMedium12.fontFamily,
            fontSize: Fonts.interMedium12.fontSize,
            color: showResend ? theme.mainText : theme.greyText
        }

    })
    //CSS Above This, Dont move this please
    return (
        <SafeAreaView style={styles.LandingPageMaster}>
            <View style={styles.loginSignUpJourneyCard}>
                <View style={styles.Header}>
                    <Text style={styles.headerHeader}>VERIFY YOUR NUMBER</Text>
                    <Text style={styles.headerTag}>OTP has been sent to XXXXXX5955</Text>
                </View>
                <View style={styles.OtpInputContainer}>
                    <TextInput
                        style={styles.input}
                        value={otp}
                        onChangeText={handleTextChange}
                        maxLength={6}
                        keyboardType="numeric"
                        textContentType="oneTimeCode"
                        autoComplete="sms-otp"
                        caretHidden={true}
                        contextMenuHidden={true}
                    />
                </View>
                <TouchableOpacity disabled={!showResend} onPress={handleResend}>
                    <Text style={styles.resendOtpText}>
                        {showResend ? 'Re-send OTP' : `Didn’t receive the OTP ? Re-send in ${secondsLeft} seconds`}
                    </Text>
                </TouchableOpacity>
                <View>
                    <TouchableOpacity disabled={otp.length < 6}>
                        <View style={styles.sendOtpButton}>
                            <Text style={styles.sendOtpText}>ENTER OTP</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <OnboardingFooter />
            </View>
        </SafeAreaView>
    )
}

export default VerifyPhoneNumber;
