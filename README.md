E-store App
E-store is a Flutter app that allows users to browse through categories and products. The app includes three screens: Splash screen as the opening screen, Home screen that displays category list and shows the current location with the area name at the top, and Products screen that shows the list of products in a specific category.

Installation
Apk Link: https://drive.google.com/file/d/1PTO_2UdvwdX2yv0BYnfqlSNV_fX52U-Q/view?usp=share_link
Clone the repository and run the following command to install the dependencies:

bash
Copy code
flutter pub get
API
The app retrieves data from the following APIs:

https://dummyjson.com/products/categories
https://dummyjson.com/products/category/smartphones
Screenshots
Add some screenshots of the app here.

How to Use
To use the app, follow these steps:

Install the app on your device or emulator.
When the app launches, the splash screen will be displayed, showing a loading indicator.
Once the data is retrieved from the API, the home screen will be displayed, showing the list of categories.
Tap on a category to see the list of products in that category.
To go back to the home screen, tap on the back button in the app bar.
State Management
The app uses Provider for state management.

Animations
The app uses Flutter animations package to create a visually pleasing user interface.

Credits
Dummy JSON for providing the API.
Provider for state management.
Flutter animations package for animations.
License
The source code is released under the MIT License.
