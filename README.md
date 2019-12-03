# rn-sign-in-with-apple

## Getting started

`$ npm install rn-sign-in-with-apple --save`

### Mostly automatic installation

`$ react-native link rn-sign-in-with-apple`

## Usage
```javascript
import { loginWithApple } from 'rn-sign-in-with-apple';

loginWithApple()
    .then(result => cosnole.log(result))
    .catch(e => console.warn(e));
```
