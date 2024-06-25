#  Universities APP
Universities APP iOS assessment app. 

## Features
1. The app consists of master and details screens.
1. The master loads a listing of university info.
1. Data loaded from the service is persisted so the app can work offline.
1. The details screen is shown when the user selects an item from the list.
1. The user can tap a refresh button in the details screen to dismiss it and trigger fetching fresh data.

## Modules/Packages
The project uses SPM to create local packages as dependencies for each Module (ListingModule and DetailsModule) beside the ListingRepo package.

## Setup
1. Check out the repository https://github.com/devMfawzy/universities-app
1. Open the `universities-app.xcodeproj` file.
1. Build the project.
1. Select the `universities-app` Scheme in Xcode and run the app.

## App Architecture
The app follows the `VIPER` Architecture.

## Dependencies
- `RealmSwift` DB for persisting loaded data.

## Testing
- Added unit tests for critical parts in the app like data loading form network and cache









