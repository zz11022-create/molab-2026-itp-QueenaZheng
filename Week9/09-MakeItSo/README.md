```
# Pet Care Tasks

Pet Care Tasks is a small Firebase app for keeping track of simple pet care reminders.

This project is based on the class demo **09-MakeItSo**.

I kept the original Firebase and Firestore structure from the tutorial and customized the app into a pet care task list.

## What I Changed

I changed the original reminder app into **Pet Care Tasks**.

I added:

- A new title: **Pet Care Tasks**
- A **New Pet Task** button
- Quick Add buttons for:
  - 🍚 Feed
  - 💧 Water
  - 🐾 Walk
- A task counter
- A pet name using `@AppStorage`
- An empty state message when there are no tasks

The Quick Add buttons reuse the original `addReminder()` function from the MakeItSo tutorial.

## How to Use

1. Open the app.

2. Tap one of the Quick Add buttons to quickly add a common pet care task.

3. You can also tap **New Pet Task** to create your own task.

4. Tap the circle next to a task to mark it as completed.

5. Tap a task to edit it.

6. Swipe a task to delete it.

7. The tasks are saved remotely in **Firebase Cloud Firestore**.

## Firebase

For this assignment, I created my own Firebase project and connected it to the app.

I used:

- Firebase Core
- Firebase Authentication
- Cloud Firestore

I confirmed that tasks created in the app were successfully saved to my Firestore database.

## Reference

This project is based on the class example:

**09-MakeItSo**

I mainly focused on understanding how the tutorial connects to Firebase and then made small UI and interaction changes without changing the main Firestore logic.
```
