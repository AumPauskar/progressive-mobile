# Progressive mobile app

## Getting started

To run the program you need to have flutter and dart installed on your computer. You can find the installation guide [here](https://flutter.dev/docs/get-started/install).

## Running the application
After installing flutter and dart you can run the program by running the following command in the terminal, since the application is built using flutter the application is cross platform and can be run on various platforms. The application has been tested on android and web.

- Running on the web
    ```bash
    flutter run -d chrome
    ```

- Running on android\
    To run the application on android you need to have an android device connected to your computer. You can connect your device using a usb cable or you can use an emulator. To run the application on an emulator you need to have an emulator installed on your computer. You can find the installation guide [here](https://developer.android.com/studio/run/emulator).
    ```bash
    flutter run -d <device name>
    ```
    If an AVD (Android Virtual Device) is already running on the computer you can run the application on the AVD by running the following command.
    ```bash
    flutter run
    ```

## Installing the application
There are two ways of installing the application on your device. The first way is to download the source code and build the application yourself via flutter by running the following command in the terminal.
```bash
flutter build <platform> // platform can be either apk or web
```
The second way is to download the pre-built application from the release page.

## Build preview
The application contains two features, one is the form that is avalaible on the home page and the other is the print layout (a pdf file) that is avalaible on the print page. The print layout generates when the **generate pdf** button is pressed.

### Web
**Home page**\
![Home page](docs_assets\home_page_web.png)

**Print page**\
![Print page](docs_assets\print_page_web.png)

### Mobile
**Home page**\
![Home page](docs_assets\home_page_mobile.png)

**Print page**\
![Print page](docs_assets\print_page_mobile.png)