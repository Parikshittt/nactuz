import React from "react";
import { StyleSheet, Text, TextInput, TouchableOpacity, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import OnboardingFooter from "../components/onboardingFooter";
import { useNavigation } from "@react-navigation/native";


function LandingPage() {
    const navigation = useNavigation();
    return (
        <SafeAreaView style={styles.LandingPageMaster}>
            <View style={styles.loginSignUpJourneyCard}>
                <View style={styles.Header}>
                    <Text style={styles.headerHeader}>Hey There</Text>
                    <Text style={styles.headerTag}>Login/SignUp to cruise through the competition</Text>
                </View>
                <View style={styles.loginSignUpButtons}>
                    <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Login Page')}>
                        <View style={styles.filledButton}>
                            <Text style={styles.filledButtonText}>LOGIN</Text>
                        </View>
                    </TouchableOpacity>
                    <TouchableOpacity style={styles.button}>
                        <View style={styles.unFilledButton}>
                            <Text style={styles.unFilledButtonText}>SIGN UP</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <OnboardingFooter />
            </View>
        </SafeAreaView>
    );
}

export default LandingPage;

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
    filledButton: {
        backgroundColor: theme.brandColor,
        height: 48,
        justifyContent: 'center',
        alignItems: 'center',
    },
    unFilledButton: {
        backgroundColor: theme.lightColor,
        borderColor: theme.brandColor,
        borderWidth: 2,
        justifyContent: 'center',
        alignItems: 'center',
        height: 48,
    },
    filledButtonText: {
        fontFamily: Fonts.interBold16.fontFamily,
        fontSize: Fonts.interBold16.fontSize,
        color: theme.lightColor,
    },
    unFilledButtonText: {
        fontFamily: Fonts.interBold16.fontFamily,
        fontSize: Fonts.interBold16.fontSize,
        color: theme.brandColor,
    },
    loginSignUpButtons: {
        flexDirection: "row",
        justifyContent: "space-between",
        gap: 10
    },
    button: {
        flex: 1,
    },
    footerText: {
        fontFamily: Fonts.interMedium12.fontFamily,
        fontSize: Fonts.interBold12.fontSize,
        color: theme.greyText,
        textAlign: 'center'
    },
    icons: {
        display: 'flex',
        gap: 30,
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center'
    }
});
