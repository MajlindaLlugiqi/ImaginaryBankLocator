		
Imaginary Bank Locator

Swift 4.2
XCode 10.1

CONTENTS OF THIS FILE
---------------------
   
 * Introduction
 * Third Parties
 * How to run the project


INTRODUCTION
------------
Imaginary Bank Locater’s main functionality is to show the location of the Branches and ATMs in map. Moreover when you tap on pins(markers) description view is shown, and when you tap on the description view it redirects you to details view for each Branch/ATM. Details view shows all details of that Branch or ATM. Also when you tap my location, shows the location of the user.

Furthermore, there is also the list of all Branches and ATMs, and by tapping them, it redirects to map view with focus on selected item.

THIRD PARTIES
-------------
In this project I have user “Google Maps SDK” for iOS. To install you need to create pod file on the project path, then add ‘pod 'GoogleMaps'’ and then run ‘pod install’. 
I have used Google Maps SDK because it is the best library that deals with Map issues. It is also more reliable compared to MapKit (it’s directions and local places are fine only in the US). Also remarkable route planning, multi-route planning, ultra filtered search results etc. 


HOW TO RUN
-----------
You have to open “ImaginaryBankLocator.xcworkspace”, set the device you want to run (simulator or real device) and click Build and Run. 



