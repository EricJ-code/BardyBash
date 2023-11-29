
## Overview

Bardy Bash will be a Rhythm game fused with RPG-like elements including a story, characters and combat. The Player will take control of a quartet of heroes as they face the Evil Bardy.Tired of having their music taken for granted, the Bardy has taken to “attacking” people indiscriminately with their sound. It is the goal of the player’s heroic party to break up the band of bards, but this task will be no easy feat.

The game currently features a main menu, audio settings, midi to bullet spawning/shooting, collision detection, user input detection and a progress bar that updates for every note or bullet hit. 

All current features are currently on the master branch. 

## Getting Started

Follow these instructions to set up, play, and understand the game.

### Prerequisites

- [Godot Engine](https://godotengine.org/download) [The .NET Version]

### Installation

1. **Clone the repository:**
   in bash: 
```bash
   git clone https://github.com/EricJ-code/BardyBash
   cd BardyBash
```


1. **Open Godot Engine:**

   - Click on "Import" and select the `project.godot` file from your cloned repository.

2. After opening, Run Project by pressing f5 or the play button in the top right corner of the Godot Engine 

## Gameplay Use Cases 

  

### 1. Starting a New Game


   **Actor:** Player

   **Preconditions:** The game is launched and on the main menu.

   **Basic Flow:**

   - Player selects "Play"

   - Game initializes a new level with the default settings.

   - Rhythm elements begin, and the player interacts with the game.

### 2. Use Case: Audio Options and Preferences

 **Actor:** Player

 **Preconditions:**  The game is launched and on the main menu.
 
 **Basic Flow:**

   **Accessing the Options Menu:**
   - From the main screen, navigate to the "Options" menu.

   **Adjusting Audio Settings:**
   - Inside the Options Menu, locate the "Audio" section.
   - Modify settings such as sound volume, music volume, and other audio-related preferences.

   **Saving Audio Preferences:**
   - Changes made in the Options Menu, including audio settings, are automatically saved.
   - When the player exits the game and returns, their chosen audio preferences persist.

   **Testing Audio Changes:**
   - To verify adjustments, play a song or interact with in-game audio elements.
   - The Godot Rhythm Game dynamically applies the configured audio settings in real-time.



This use case allows players to fine-tune their audio experience within the game, ensuring personalized preferences are both easily adjustable and persistent across gaming sessions.

### 3. Returning to Main Menu

 **Actor:** Player
 
 **Preconditions:** The scene is on Level 1 and the escape button has been pressed. 
 
 **Basic Flow:** 
 
   - The escape button has been pressed in Level 1

   - Options Menu overlays Level 1 

   - Player presses button "Return to Main Menu"

   - Main Menu appears
  

### 4. Gameplay - Hitting Notes

  

   **Actor:** Player, Game

   **Preconditions:** Player is in Level 1 after pressing "Play" in the Main Menu.

   **Basic Flow:**

   - Notes appear on the screen according to the song's rhythm.

   - Player hits the corresponding input (e.g., tapping, pressing a key) in sync with the rhythm.

   - Game registers successful hits and updates the player's score.

## Testing with GUT

  

**To run tests using GUT (Godot Unit Test framework) 

  

   - In the Godot editor, navigate to the "GUT" tab.

   - Click "Run Tests" to execute your tests.

   - Review the results in the GUT tab.

## Testing using GDMUT

**To Run tests using GDMUT 

- Make sure the test files are in the file path "test/unit"

- Click load tests

	- You can select specific or all

- Click run tests
