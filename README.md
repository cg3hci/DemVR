# ECARules4All

Code repository for the implementation of the ECARules4All project

ECARules4All is a Unity package that enables users without coding knowledge to setup Virtual Reality worlds. The solution is based on templates that can be configured for creating the users' own experiences.
More information can be found here: https://cg3hci.dmi.unica.it/lab/en/projects/ecarules4all

## Installation

### Prerequisites

- The following packages installed from the Package manager:
  - XR Interaction Toolkit;
  - Universal RP;
  - Oculus XR Plugin (for using Oculus Headsets).

### Configuration

- Download from the Releases section of this repository the ECARules4All prefab;
- Set `Edit > Project Settings > Player > Settings for PC, Mac & Linux Standalone > Expand "Other Settings" > Api Compatibility Level => .NET 4.x`;
- Set `Edit > Project Settings > XR Plug-In Management > Plug-in Providers > Check "Oculus"`;
- With the Unity project open double click on the file and import all the files;
- Import the ECAKit prefab into your scene (can be found in `Assets > Prefabs > ECAKit.prefab`).
