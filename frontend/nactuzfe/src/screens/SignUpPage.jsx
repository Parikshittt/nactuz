import React, { useState } from "react";
import { SafeAreaView, TextInput, TouchableOpacity, View, Text } from "react-native";
import OnboardingFooter from "../components/onboardingFooter";
import { StyleSheet } from "react-native";
import theme from "../assets/theme";
import Fonts from "../assets/Font";
import { useDispatch, useSelector } from "react-redux";
import { setPhoneNumber as setPhoneNumberAction } from "../redux/phoneSlice";

function SignUpPage() {
    const indianStatesAndCities = [
        "Andhra Pradesh", "Visakhapatnam", "Vijayawada", "Guntur", "Nellore", "Kurnool",
        "Arunachal Pradesh", "Itanagar",
        "Assam", "Guwahati", "Dibrugarh", "Silchar", "Jorhat", "Nagaon",
        "Bihar", "Patna", "Gaya", "Bhagalpur", "Muzaffarpur", "Purnia",
        "Chhattisgarh", "Raipur", "Bilaspur", "Durg", "Bhilai", "Korba",
        "Goa", "Panaji", "Margao", "Vasco da Gama", "Mapusa", "Ponda",
        "Gujarat", "Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar",
        "Haryana", "Chandigarh", "Faridabad", "Gurgaon", "Hisar", "Panipat",
        "Himachal Pradesh", "Shimla", "Dharamshala", "Mandi", "Solan", "Bilaspur",
        "Jharkhand", "Ranchi", "Jamshedpur", "Dhanbad", "Bokaro", "Deoghar",
        "Karnataka", "Bengaluru", "Mysuru", "Mangaluru", "Hubballi", "Belagavi",
        "Kerala", "Thiruvananthapuram", "Kochi", "Kozhikode", "Kollam", "Thrissur",
        "Madhya Pradesh", "Bhopal", "Indore", "Gwalior", "Jabalpur", "Ujjain",
        "Maharashtra", "Mumbai", "Pune", "Nagpur", "Nashik", "Aurangabad",
        "Manipur", "Imphal",
        "Meghalaya", "Shillong",
        "Mizoram", "Aizawl",
        "Nagaland", "Kohima", "Dimapur",
        "Odisha", "Bhubaneswar", "Cuttack", "Rourkela", "Berhampur", "Sambalpur",
        "Punjab", "Ludhiana", "Amritsar", "Jalandhar", "Patiala", "Bathinda",
        "Rajasthan", "Jaipur", "Jodhpur", "Udaipur", "Kota", "Ajmer",
        "Sikkim", "Gangtok",
        "Tamil Nadu", "Chennai", "Coimbatore", "Madurai", "Tiruchirappalli", "Salem",
        "Telangana", "Hyderabad", "Warangal", "Nizamabad", "Khammam", "Karimnagar",
        "Tripura", "Agartala",
        "Uttar Pradesh", "Lucknow", "Kanpur", "Ghaziabad", "Agra", "Meerut",
        "Uttarakhand", "Dehradun", "Haridwar", "Roorkee", "Haldwani", "Rishikesh",
        "West Bengal", "Kolkata", "Howrah", "Durgapur", "Siliguri", "Asansol"
    ];

    const [firstSuggestion, setFirstSuggestion] = useState('');
    const [userInput, setUserInput] = useState('');

    const clickedOnSuggestion = () => {
        if (firstSuggestion) {
            setUserInput(firstSuggestion);
            setFirstSuggestion('');
        }
    };

    const handleLocalityInputChange = (text) => {
        setUserInput(text);
        const sortedIndianStatesAndCities = [...indianStatesAndCities].sort((a, b) => a.localeCompare(b));
        if (text.trim() === '') {
            setFirstSuggestion('');
            return;
        }
        const match = sortedIndianStatesAndCities.find(location =>
            location.toLowerCase().startsWith(text.toLowerCase())
        );
        if (match) {
            setFirstSuggestion(match);
        } else {
            setFirstSuggestion('');
        }
    };


    const dispatch = useDispatch();
    const [phoneNumber, setPhoneNumber] = useState('');
    const [buttonOpacity, setButtonOpacity] = useState(0.5);
    const defaultPhoneNumber = useSelector((state) => state.phone.phoneNumber);

    const handlePhoneNumberChange = (text) => {
        const formattedPhoneNumber = text.replace(/[^0-9]/g, '');
        setPhoneNumber(formattedPhoneNumber);
        if (formattedPhoneNumber.length === 10) {
            setButtonOpacity(1);
        } else {
            setButtonOpacity(0.5);
        }
    };

    const handleSendOtpOnSignUpPage = () => {
        // Replace with your logic for sending OTP and navigating accordingly
        if (phoneNumber === '1234567899') {
            // navigation.navigate('Verify OTP Page')
            dispatch(setPhoneNumberAction(phoneNumber))
            console.log('Navigate to Verify OTP Page');
        } else {
            dispatch(setPhoneNumberAction(phoneNumber));
            // navigation.navigate('Sign Up Page')
            console.log('Navigate to Sign Up Page');
        }
    };

    //Styling
    const styles = StyleSheet.create({
        container: {
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
        header: {
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
            borderBottomColor: theme.brandColor,
            position: 'relative'
        },
        suggestionContainer: {
            borderColor: theme.brandColor,
            borderWidth: 1,
            borderRadius: 5,
            paddingHorizontal: 10,
            marginTop: 10,
        },
        suggestionText: {
            height: 20,
            color: theme.mainText,
        },
    });
    //Styling

    return (
        <SafeAreaView style={styles.container}>
            <View style={styles.loginSignUpJourneyCard}>
                <View style={styles.header}>
                    <Text style={styles.headerHeader}>Welcome To Nactuz!</Text>
                    <Text style={styles.headerTag}>We are thrilled to have you on board.</Text>
                </View>
                <View>
                    <View>
                        <Text style={styles.inputHeader}>Your Name</Text>
                        <View style={styles.inputNumberContainer}>
                            <TextInput
                                style={styles.inputClass}
                                maxLength={20}
                                onChangeText={handlePhoneNumberChange}
                            />
                        </View>
                    </View>
                    <View>
                        <Text style={styles.inputHeader}>Choose your locality</Text>
                        <View style={styles.inputNumberContainer}>
                            <TextInput
                                style={styles.inputClass}
                                maxLength={20}
                                onChangeText={handleLocalityInputChange}
                                value={userInput}
                                onBlur={clickedOnSuggestion}
                            />
                        </View>
                        {firstSuggestion ? (
                            <TouchableOpacity onPress={clickedOnSuggestion}>
                                <View style={styles.suggestionContainer}>
                                    <Text style={styles.suggestionText}>{firstSuggestion}</Text>
                                </View>
                            </TouchableOpacity>
                        ) : null}
                    </View>
                    <View>
                        <Text style={styles.inputHeader}>10 digit mobile number</Text>
                        <View style={styles.inputNumberContainer}>
                            <Text style={styles.countryCodeText}>+91</Text>
                            <TextInput
                                style={styles.inputClass}
                                keyboardType="numeric"
                                defaultValue={defaultPhoneNumber}
                                maxLength={10}
                                onChangeText={handlePhoneNumberChange}
                            />
                        </View>
                    </View>
                </View>
                <View>
                    <TouchableOpacity disabled={phoneNumber.length < 10} onPress={handleSendOtpOnSignUpPage}>
                        <View style={styles.sendOtpButton}>
                            <Text style={styles.sendOtpText}>SEND OTP</Text>
                        </View>
                    </TouchableOpacity>
                </View>
                <OnboardingFooter />
            </View>
        </SafeAreaView>
    );
}

export default SignUpPage;
