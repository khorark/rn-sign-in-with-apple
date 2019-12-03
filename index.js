import {NativeModules} from 'react-native';

const { RnSignInWithApple } = NativeModules;

export const loginWithApple = async () => {
    const data = await RnSignInWithApple.login();
    return JSON.parse(data);
};