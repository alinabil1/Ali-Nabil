*** Settings ***
Library           Browser   30    MANUAL

*** Keywords ***

begin Web Test
    # supported browsers : 1.chromium	2.firefox  3.webkit
    # browsers are headless by default
    New Browser    ${browser}    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
#    New Context    viewport={'width': 1366, 'height': 768}
    new page       about:blank

