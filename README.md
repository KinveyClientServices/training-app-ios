# IOS-Starter
Starter app for Kinvey iOS 3.0 SDK

This is a iOS Sample app to illustrate how to use version 3.0 of the [Kinvey](http://www.kinvey.com) iOS library. 

_Note: This starter app uses a developer preview of the Kinvey iOS 3.0 Library. To use the GA version, refer to the [Devcenter](http://devcenter.kinvey.com/ios-v3.0)_ 

## Concepts illustrated in this sample
* Logging in a user
* Using the 3.0 DataStore API to send and retrieve data
* Managing offline data in a "Sync" store and synchronizing it with the backend

## Prerequisites
* iOS 8 or later
* Kinvey iOS library 3.0.0 (bundled in as a developer preview)
* [Kinvey](https://console.kinvey.com) app ID and secret. Before compiling, replace `appKey` and `appSecret` in the `AppDelegate` with values you obtain from the console.

### Data Model
* Partner
  * partnername
  * partnercopmany
  * partneremail
* Todo
  * action
  * duedate
  * completed
* Products
  * productname
  * productdesc

### Training
The goal of the training is to be exposed to the different forms of data and auth access provides.

**Topics**

* Auth
  * Kinvey Login
  * Mobile Identity Connect Login
  * Facebook Social Login
* Products
  * Default Cache Data Store
  * Sort
  * Skip/Limit
  * Delete
* Partners
  * Sync Data Store
  * Cache data from Kinvey locally
  * Push local changes to Kinvey
  * Sync changes with Kinvey (push then pull)
* Todos
  * Sync Data Store
  * Push
  * Pull
* Collateral
  * Kinvey File Store
* Media
  * Network Data Store
  * Update Media
  * Delete media

## License

Copyright (c) 2016 Kinvey, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

