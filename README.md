# Pokedex

This app is a Pokédex inspired by the original Pokémon anime series.
It utilizes the [PokéApi](https://pokeapi.co/docs/v2) to fetch data on all Pokemon.

Currently, only Kanto region Pokémon are available, but future updates may include additional regions.

The user interface (UI) is inspired by [this](https://www.figma.com/design/ljSEdt2o1jlhNAICqiLVo4/Pok%C3%A9dex-(Community)?node-id=314-3&node-type=canvas&t=E6n3ZAr8JPYqRo95-0) beautiful Pókedex design in Figma.

## Getting Started

The Pokédex app is a cross-platform application designed to run on both mobile devices (***Android & iOS***) and web browsers.

The project is structured into two main parts:
- mobile-app folder: Houses the core app logic and platform-specific implementations for mobile (Android and iOS) and web.
- ui_kit folder: Houses reusable UI components and utilities shared across both mobile and web versions, promoting code consistency and maintainability.


## How to use

**Step 1:**

To properly execute this project you must have Flutter 3.24.3 version or upper installed.
You can known you current flutter version by executing this command on a terminal:

```flutter --version```

If your version is lower than the project's one, you can upgrade Flutter version by executing:

```flutter upgrade```

For more information check [Flutter official documentation](https://docs.flutter.dev/release/upgrade).

**Step 2:**

Go to both `mobile-app` and `ui_kit/pokedex_ui_kit/` folders and execute the following command in console to get the required dependencies:

```flutter pub get```

**Step 3:**

Go to `mobile-app` folder and execute the following command in console to run the project:

```flutter run```

Find more information on how to run a Flutter project in your IDE in the [official documentation](https://docs.flutter.dev/get-started/test-drive).