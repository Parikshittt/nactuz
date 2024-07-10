import React from "react";
import { SafeAreaView, StyleSheet, Text, View } from "react-native";
import theme from "../assets/theme";
import Fonts from "../assets/Font";

function VerifyPhoneNumber() {
    function handleOtpComplete() {
        console.log('OTP console')
    }
    return (
        <SafeAreaView style={styles.LandingPageMaster}>
            <View style={styles.loginSignUpJourneyCard}>
                <View style={styles.Header}>
                    <Text style={styles.headerHeader}>VERIFY YOUR NUMBER</Text>
                    <Text style={styles.headerTag}>OTP has been sent to XXXXXX5955</Text>
                </View>
            </View>
        </SafeAreaView>
    )
}

export default VerifyPhoneNumber;

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

})
//CSS Above This, Dont move this please