package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;

public class RnSignInWithAppleModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private static final String E_MODULE_ERROR = "E_MODULE_ERROR";

    public RnSignInWithAppleModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RnSignInWithApple";
    }

    @ReactMethod
    public void sampleMethod(String stringArgument, int numberArgument, Callback callback) {
        // TODO: Implement some actually useful functionality
        callback.invoke("Received numberArgument: " + numberArgument + " stringArgument: " + stringArgument);
    }

    @ReactMethod
    public void login(Promise promise) {
        promise.reject(E_MODULE_ERROR, "Module not supported Android");
    }
}
