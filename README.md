Task : The was to create an IOS app where customers can see the list of underground lines (tube line) with the name of the tube line and service disrupted for a particular line. Taking consideration of the disabled people , the app should have accessibility voice over. 

Implementation:  Taking into consideration Apple framework and comparing the benefits of Swift UIKIT and SwiftUI , I have decided to implement the Swift UI.  For this example , I have followed the MVVM Architecture pattern. For handling the network call , the apple native framework was used (URL Session) instead of using any third party framework. To handle the concurrency , I used async and await which is a recommended way to handle concurrency in IOS rather than the closure approach which was used before  async and await. The accessibility is also implemented and tested as well. 

Unit Testing: Unit testing is required to make sure that app functionality is working according to the expectation. For unit testing , I have followed the TDD(Test Driven Development) . Which is the best way to do the unit testing. I have written unit test cases for most of the business logic and mock data. 

Testing the App into Simulator: When the app is launched, it will display the list of tube line name and service status of the particular line as it is shown into requirements. Here is the screenshot  and there is no  disrupted line.

![Simulator Screen Shot - iPhone 14 Pro - 2023-10-23 at 20 50 34](https://github.com/MohammadHossanICT/ChallangeDemo/assets/100123501/ad56cb15-743d-4fb3-9f10-393ca7028bee)

Accessibility : I have tested the accessibility into a simulator . To test the accessibility , we need to  select the Accessibility inspector and select the simulator and start the navigation. Here is the screenshot.  




Here is the screenshot when the tube line and service update with accessibility voice over ..


