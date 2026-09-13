# Android Emulator on Kubernetes

Run a headless Android emulator inside Kubernetes using hardware-assisted
virtualization, Docker and Appium.

## Problem

Mobile automation workflows often depend on developers running Android Studio
or a local Android emulator manually.

This creates several problems:

- Android Studio is resource-heavy
- automation depends on a developer workstation
- closing the local emulator interrupts long-running jobs
- the environment is difficult to reproduce
- scaling multiple emulator instances is inconvenient

## Solution

This project runs an Android emulator as a containerized workload inside
Kubernetes.

The emulator runs independently from developer machines and can be used
by automation/parsing workloads through Appium.

Architecture:

Parser / Automation Client
        |
        v
     Appium
        |
        v
  UiAutomator2
        |
        v
 Android Emulator
        |
        v
 Docker Container
        |
        v
 Kubernetes Pod
        |
        v
 KVM / Nested Virtualization
