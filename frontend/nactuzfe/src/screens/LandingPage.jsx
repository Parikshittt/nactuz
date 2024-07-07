import React from "react";
import { StyleSheet, Text } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
import theme from "../assets/theme";

function LandingPage() {
    return (
        <SafeAreaView style={styles.LandingPageMaster}>
            <Text>Landing Page</Text>
        </SafeAreaView>
    )
}

export default LandingPage;

const styles = StyleSheet.create({
    LandingPageMaster: {
        flex: 1,
        backgroundColor: theme.darkColor
    }
})