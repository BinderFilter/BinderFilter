## BinderFilter

BinderFilter is a Linux kernel message firewall for Android. It is written as a kernel driver that implements reading, blocking, and modifying Android IPC messages. Our BinderFilter kernel driver hooks Android Binder's kernel driver in /drivers/staging/android/binder.c. 

Android's Binder IPC system completely mediates all inter-application messages, including requests by applications for private user data. We give users control and visibility over all such IPC messages, including dynamic permission blocking, with our open source BinderFilter project. This includes userland filtering, blocking, and logging of any IPC message in Android. Userland policy can be informed by the system's context, i.e. environmental data such as GPS location and wifi network, which addresses the current lack of native Android support for context-based security policies.

![alt tag](./documentation/bf_hook.png?raw=true)

## Parsing 

BinderFilter parses kernel IPC messages, which are often unencrpyted and assumed by applications to be secure - as demonstrated [here](https://www.blackhat.com/docs/eu-14/materials/eu-14-Artenstein-Man-In-The-Binder-He-Who-Controls-IPC-Controls-The-Droid.pdf). These messages include Intents sent to system services, and Intents to start new activities. An example IPC message from the GPS system service is shown below. 

```
{(0)@(29)(0)android.content.IIntentSender(0)(0)(0)(1)(0)(255)(255)(255)(255)(0)(0)(255)(255)(255)(255)(0)(0)(255)(255)(255)(255)(255)(255)(255)(255)(0)(0)(0)(0)(0)(0)(0)(0)(254)(255)(255)(255)(224)(4)(0)BNDL(3)(0)8(0)com.google.android.location.internal.EXTRA_LOCATION_LIST(0)(0)(11)(0)(1)(0)(4)(0)(25)(0)android.location.Location(0)(7)(0)network(0)(192)(191)(187)(145)T(1)(0)@(165)R(132)\(0)(177)(237)(254)(194)(60)(218)(69)(64)(121)(189)(234)(183)(101)(18)(82)(192)(0)(0)(0)(0)(0)(0)(0)(0)(0)(0)(0)(0)(0)(0)(1)(0)u(19)(...}
```

The GPS coordinates of interest are re-cast below.

```
*(double*)({177,237,254,194,60,218,69,64}) = 43.704979
*(double*)({121,189,234,183,101,18,82,192}) = -72.287458
```

## Documentation

See the [wiki](https://github.com/BinderFilter/BinderFilter/wiki) for documentation.
For the writeup and slides, see https://binderfilter.github.io/.

## Usage

See https://github.com/BinderFilter/BinderFilter/wiki/Usage

## Setup

Because we hook an existing Linux driver, BinderFilter code requires a recompilation of the Linux source tree and flashing this new kernel onto an Android phone. We have tested and verified this method on a Google Nexus 7 (2013- flo). For development setup, see the [related documentation](https://github.com/BinderFilter/BinderFilter/wiki/Setup). To install the pre-compiled kernel image:

1. Root your Android phone
2. Enable USB debugging
3. Unlock bootloader
4. Download fastboot and adb

5. Connect your phone to the laptop with USB debugging enabled
```
adb reboot bootloader
fastboot flash boot ./resources/kernel-image.img
```
6. Press start
7. Phone will reboot, then install picky apk (adb install picky.apk) or the command line tools.

## Cross-compiling for Android

This is a complex process. Please see "Compile linux kernel for android" in ./documentation/cross-compiling/cross_compiling.txt and https://github.com/BinderFilter/BinderFilter/wiki/Setup 

## Picky

Picky is the Android application that allows users to set firewall policy. See github.com/BinderFilter/BinderFilter/Picky.

## Presentations 

This project has been presented at Summercon 2016 and Shmoocon 2017.

## Contributors 

This project started as a Senior Honors Thesis at Dartmouth College. Sergey Bratus advised and designed the project, and David Wu is the main contributer. Kirti Vardhan Rathore is another contributor to the project.
Ionic Security has provided funding for testing phones and tablets. 
