# Usaf'ty

Usaf'ty is an application, designed in the simplest way to use, aimed at achieving the great mission of making the city (the environment) clean. To do this, it works with data drawn from one part of the population and another from the agencies responsible for waste collection in the city, and if necessary with the State on certain points.

## Run & Installation

To run the code, start by cloning the code into your machine, with the command :

```code
git clone https://github.com/GDSC-UCB/Usaf-ty.git
```

Then make sure you have all the necessary tools that Flutter requires to run on a computer (Flutter SDK) with an Android and/or iOS emulator, and Flutter version 3.16.9.

Download all the packages that the project used, just by using the command:

```code
flutter clean
flutter pub get
flutter pub outdated
```

For Maps, make sure you have accepted permission for the Maps API to access Device features.

For a successful connection with Firebase, make sure that all Firebase packages used are installed, be connected to the internet to use certain features such as authentication, sending feedback, advice, signaling and others. And if it requires Firebase configuration for some tools like npm, nodeJS, please follow Firebase documentation.

But it should be noted that we were unable to test on iOS devices since all had just Windows, which means that for the execution on iOS surely we can have special configurations that we could not do since we did not have errors to execute the ours on Android.

### Contribution
For any contributions or modifications please add your own branch using the functionality you want to add as the branch name.
