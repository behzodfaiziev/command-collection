# .NET Core Commands
Welcome to the .NET Core Commands section! This document provides a comprehensive collection of .NET Core commands to assist developers in various aspects of .NET Core application development.

## Table of Contents
- [Initialization](#initialization)
- [Build and Run](#build-and-run)
- [Dependency Management](#dependency-management)
- [Additional Commands](#additional-commands)
- [Contributing](#contributing)

## Initialization
- `dotnet new console -n YourProjectName`: Create a new .NET Core console project.
- `dotnet new web -n YourWebProjectName:`: Create a new .NET Core web project.
- `dotnet new classlib -n YourLibraryName`:Create a new .NET Core class library. Replace YourProjectName, YourWebProjectName, or YourLibraryName with your desired project or library name.

## Build and Run
- `dotnet build`: Build the .NET Core project.
- `dotnet run`: Run the .NET Core application.

## Dependency Management
- `dotnet restore`: Restore project dependencies.
- `dotnet clean`: Clean the project and remove build artifacts.
- `dotnet add package YourPackageName`: Add a NuGet package reference.
- `dotnet add package YourPackageName --version x.x.x`: Add a specific version of a NuGet package.
- `dotnet add package YourPackageName --version "*"`: Add the latest version of a NuGet package. Replace YourPackageName with the desired NuGet package name.

## Additional Commands
- `dotnet --version`: Display the installed .NET SDK version.
- `dotnet list reference`: List project references.
- `dotnet test`: Run unit tests.
- `dotnet publish -c Release -r win10-x64`: Publish the application for Windows x64.

## Contributing
Feel free to contribute by opening issues or pull requests. Your feedback is highly appreciated!






