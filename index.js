import {NativeModules} from 'react-native';

const { RnSignInWithApple } = NativeModules;

export const loginWithApple = async () => {
    try {
        const data = await RnSignInWithApple.login();
        return JSON.parse(data);
    } catch (e) {
        throw new Error(e)
    }

};