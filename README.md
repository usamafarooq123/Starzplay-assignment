# Starzplay-assignment

This is a movie app that utilizes an API to provide details of season functionality. It follows the Model-View-ViewModel (MVVM) architecture with a Router component for navigation.



<b>The app follows the Model-View-ViewModel (MVVM) architecture with a Router component for navigation.</b>

### Model:
The Model represents the data and business logic of the application. It encapsulates the movie data, caching mechanisms, and API communication.
### View:
The View represents the user interface (UI) elements and their layout. It includes screens for displaying the movie list, movie details, search functionality, and error messages.
### ViewModel:
The ViewModel acts as an intermediary between the Model and the View. It retrieves movie data from the Model, formats it for the View, and provides methods for handling user actions such as liking a movie, searching, and fetching new data.
### Router:
The Router handles navigation within the app. It is responsible for transitioning between different screens and coordinating the flow of the app.

### Pods
- kingfisher
- Alamofire
Additionally, I created a separate pod for handling all network-related functionality, which keeps the networking logic isolated and modular.

### Known Issues:
Missing Loader: The app currently lacks a loading indicator during data fetching. I missed implementing this feature, which affects the user experience by not showing feedback during API requests..

### Language
 - Swift 


