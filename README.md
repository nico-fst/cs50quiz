# CS50quiz by Nico Stern

![‎2023_08 CS50 Final Project ‎006](https://github.com/nico-fst/cs50quiz/assets/108625504/75a3edd0-f220-4a56-bf1c-243ed199ceb5)

## Description

### Short description (Project)
Using the knowledge gained througout the ten weeks of CS50x, this Swift code for iOS devices (tested on iPhone 14 Pro running iOS 16) builds a Single Choice QuizApp.
The questions are fetched and parsed as .json from a Firestore Database.
The project is connected to a Firebase via SDK packages (particulary FireAuth). Since Swift is not covered in the CS50x input, I made use of several online tutorials, eg. for Firebase or .json parsing.

### Description (Project Components)

#### Model
- _Question:_ the struct in which the json data gets parsed. It appears to be an Identifiable, the ID will be added later in the parsing process in _ViewModel_.

#### Views
- _ContentView:_ The HomeScreen with the SF symbol, greeting and question selection. The WheelPicker for questions limits the selection to the maximum number of questions and increments in steps of 5. The "Start" button is a NavigationLink to the QuizView.
- _QuizView:_ While there are questions left, the questions are displayed. The hint bubbles at the top adapt to the question's properties and after selecting an answer box the colours are updated.
- _SummaryView:_ Shown after completing the quiz (detected by the overlay, providing the necessary parameters). Shows the amount of correctly answered questions provided through _QuizView_.

#### ViewModels
- _ViewModel:_ Defines a `ViewModel` class that handles fetching and managing a collection of `Question` objects from a Firestore database, offering shuffled and unshuffled question sets. It also provides computed properties for selectable question counts and efficiently divides available counts based on the total question pool.

#### Components
_PrimaryButton and CustomProgressBar:_ custom components used in other files

## Roadmap

### Already implemented features
- [x] HomeScreen: be able to select { 5x | x∈ℤ > 0 } ≤ questions
- [x] HomeScreen: "Shake it" button triggered by physically shaking device, changes SF symbol's color
- [x] parse data from .json instead of struct within Swift
- [x] fetch data from internet: Firestore Database

### Roadmap: things I would love to implement in future
- [ ] authenticate via FireBase Auth
    - [x] login
    - [ ] logout
- [ ] extend Application to Apple Watch
- [ ] save Highscores to Firestore Database and
- [ ] QuizView: show live feedback of percentage of people clicking on each possible answer
- [ ] HomeScreen: select own .json files (from Firestore Database)
- [ ] HomeScreen: add questions to existing question .jsons
- [ ] select custom Design palette




![‎2023_08 CS50 Final Project ‎011](https://github.com/nico-fst/cs50quiz/assets/108625504/17f55fcf-8052-4110-8366-e6437b2abb2d)
![‎2023_08 CS50 Final Project ‎014](https://github.com/nico-fst/cs50quiz/assets/108625504/8c92b3dd-d513-43c8-b23e-02aa851c4891)
