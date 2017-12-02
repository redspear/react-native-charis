
# react-native-charis

## Getting started

`$ npm install react-native-charis --save`

### Mostly automatic installation

`$ react-native link react-native-charis`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-charis` and add `RNCharisDecode.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCharisDecode.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCharisDecodePackage;` to the imports at the top of the file
  - Add `new RNCharisDecodePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-charis'
  	project(':react-native-charis').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-charis/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-charis')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNCharisDecode.sln` in `node_modules/react-native-charis/windows/RNCharisDecode.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Charis.Decode.RNCharisDecode;` to the usings at the top of the file
  - Add `new RNCharisDecodePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNCharisDecode from 'react-native-charis';

// TODO: What to do with the module?
RNCharisDecode;
```
  