# Visual-ACPICA-for-UEFI-Shell

![LOGO](https://github.com/KilianKegel/Visual-ACPICA-for-UEFI-Shell/blob/main/LOGO.PNG)

ACPI CA (ACPI component architecture) reference implementation for UEFI, using Visual Studio 2022 build environment.

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
