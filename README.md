# Visual-ACPICA-for-UEFI-Shell

![LOGO](https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell/blob/main/LOGO.PNG)

ACPI CA (ACPI component architecture) reference implementation for UEFI, using Visual Studio 2022 build environment.

**NOTE:** That project is discussed in details at https://github.com/tianocore/edk2-staging/tree/CdePkg/blogs/2022-01-16#cdepkgblog-2022-01-16

## Goal
The [ACPI Component Architecture (ACPICA) project](https://acpica.org/) 
provides an operating system (OS)-independent reference implementation of the Advanced Configuration and Power Interface Specification (ACPI).

**Visual-ACPICA-for-UEFI-Shell**  is the adaptation for UEFI Shell. 
This task was suggested by [@ajfish](https://github.com/ajfish), [@jljusten](https://github.com/jljusten) and  bjjohnson at <br>
[ tianocore / tianocore.github.io ](https://github.com/tianocore/tianocore.github.io/wiki/Tasks):<br>
https://github.com/tianocore/tianocore.github.io/wiki/Tasks#port-acpi-ca-to-a-shell-application.

## Approach
ACPICA provides a reference implementation for 32Bit-Windows as a Visual Studio 2017 solution here:<br>
https://acpica.org/downloads/windows-source

Based on that source code package the transition to a 64Bit UEFI Shell Built could be easily done,
using the Microsoft C Library LIBCMT.lib compatible UEFI C Library **Toro C Library** 
https://github.com/KilianKegel/toro-C-Library#toro-c-library-formerly-known-as-torito-c-library

Additionally it was necessary to create the [Win32API4UEFI](https://github.com/KilianKegel/Win324UEFI)--sub-project,
to get required Win32-API equivalents for UEFI.

The original source directory from the [`acpica-win-20210930.zip`](https://acpica.org/sites/acpica/files/acpica-win-20210930.zip) 
archive is used. It is just renamed to [`acpica-win-20210930-source`](https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell/tree/main/acpica-win-20210930-source).

All changes to the original source code are encapsulated by the `VISUAL_ACPICA_FOR_UEFI` build switch.

## HowTo
#### 1. install Visual Studio 2022 on a Windows PC<br>
https://github.com/KilianKegel/HowTo-setup-an-UEFI-Development-PC#howto-setup-an-uefi-development-pc

<del>#### 2. install additional tools <br>
Follow the guidance to get FLEX/BISON running on that build machine<br>
https://acpica.org/downloads/windows-source</del>

#### 2. get the project to the build machine <br>
[Visual-ACPICA-for-UEFI-Shell](https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell)

#### 3. run LAUNCH.BAT to begin – don't invoke AcpiComponents.sln directly <br>
FLEX/BISON automatically downloaded and extracted *to the project folder* initially by **LAUNCH.BAT**<br>
https://github.com/KilianKegel/Howto-setup-a-UEFI-Development-PC#preparation-for-upcoming-portable-projects<br>
**PATH** updated by **LAUNCH.BAT**.


## Revision history
### 20250906
* reorganize project files:
    * add [**ACPICA source**](https://github.com/acpica/acpica) files as **git subproject** (tag **20250807**)
* update to **toro C Library v0.9.6 Build 757**
* update to **Visual-LIBWIN32-for-UEFI**
### 20250413
* fix `.gitignore` issue
* update to [**toro C Library v0.9.1 Build 267**](https://github.com/KilianKegel/Visual-TORO-C-LIBRARY-for-UEFI)
* update to [**Visual-LIBWIN32-for-UEFI 20250102**](https://github.com/KilianKegel/Visual-LIBWIN32-for-UEFI)
### 20241027
* update to ACPICA **v20240927** taken from [Windows Format Source Code and Build Environment (.zip, 3 MB)](https://github.com/user-attachments/files/17171020/acpica-win-20240927.zip)
* update to **TORO C Library** *20241013, v0.8.7 Build 200*
* intern: rename ACPICA sourcecode folder from `acpica-win-20210930-source` to `acpica-win-source`
### 20240113
* convert to **PORTABLE MODEL** – https://github.com/KilianKegel/Howto-setup-a-UEFI-Development-PC#preparation-for-upcoming-portable-projects
    * FLEX/BISON automatically downloaded and installed *in the project folder*
* update to **TORO C Library** *20231228*, copyright update only
* replace deprecated **Win324UEFI** by current **Visual-LIBWIN32-for-UEFI**
### 20231014
* update to **TORO C Library** *20231014*
### 20230910
* update to **TORO C Library** *20230909*
* keep and publish all related .EFI binaries and .MAP files https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell/tree/main/x64/UEFIShell
### 20230410
* update to [TORO C Library 20230409](https://github.com/KilianKegel/toro-C-Library#20230409)
### 20211101 alpha
* all projects build with minor compiler warnings
* all projects pass simple tests in the UEFI Shell
    * `AcpiDump.efi` dumps all ACPI tables
    * `AslCompiler.efi` processes [`badcode.asl`](https://github.com/RehabMan/Intel-iasl/blob/master/tests/misc/badcode.asl)
* further and comprehensive tests should be done by an ACPI expert
