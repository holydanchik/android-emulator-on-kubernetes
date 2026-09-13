#!/usr/bin/env python3
"""Create a minimal Appium session against the Kubernetes-hosted emulator."""

import os

from appium import webdriver
from appium.options.android import UiAutomator2Options

server_url = os.getenv("APPIUM_URL", "http://127.0.0.1:4723")
options = UiAutomator2Options().load_capabilities(
    {
        "platformName": "Android",
        "appium:automationName": "UiAutomator2",
        "appium:deviceName": "Android Emulator",
        "appium:noReset": True,
        "appium:newCommandTimeout": 120,
    }
)

driver = webdriver.Remote(server_url, options=options)
try:
    print(
        {
            "platformVersion": driver.capabilities.get("platformVersion"),
            "deviceName": driver.capabilities.get("deviceName"),
            "sessionId": driver.session_id,
        }
    )
finally:
    driver.quit()
