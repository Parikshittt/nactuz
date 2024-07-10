import React from "react";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import LinkedIn from '../assets/images/linkedin.svg'
import Instagram from '../assets/images/instagram.svg'
import Email from '../assets/images/email.svg'

function OnboardingFooter() {
    return (
        <View style={styles.footer}>
            <View style={styles.icons}>
                <LinkedIn />
                <Instagram />
                <Email />
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