import { NativeModules } from 'react-native';

type RnCharisType = {
  multiply(a: number, b: number): Promise<number>;
};

const { RnCharis } = NativeModules;

export default RnCharis as RnCharisType;
