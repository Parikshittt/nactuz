import React from "react";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import linkedinIcon from '../assets/images/linkedin.png'
import instagramIcon from '../assets/images/instagram.png'
import emailIcon from '../assets/images/email.png'

function OnboardingFooter() {
    return (
        <View style={styles.footer}>
            <View style={styles.icons}>
                <Image source={linkedinIcon} />
                <Image source={instagramIcon} />
                <Image source={emailIcon} />
            </View>
            <Text style={styles.footerText}>By creating an account, I accept the <Text style={{ fontFamily: Fonts.interBold12.fontFamily, fontSize: Fonts.interBold12.fontSize, color: theme.mainText }}>Terms & Conditions</Text></Text>
            <Text style={styles.footerText}>Version 1.0.0</Text>
        </View>
    )
}

export default OnboardingFooter;

const styles = StyleSheet.create({
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
})