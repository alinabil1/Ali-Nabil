*** Settings ***
Library           Browser   30    MANUAL

*** Variables ***
${EMAIL_LOCATOR} =  id=email
${PASSWORD_LOCATOR} =  id=pass
${LOGIN_BTN_LOCATOR} =  //button[@name='login']
${HOME_ICON_LOCATOR} =  xpath=//a[@aria-label='Home']

*** Keywords ***

fill email field
    [Arguments]     ${Email}
    type text  ${EMAIL_LOCATOR}    ${Email}

fill password field
    [Arguments]     ${Password}
    type text  ${PASSWORD_LOCATOR}   ${Password}

click on sign in button
   click  ${LOGIN_BTN_LOCATOR}

go to login page
    [Arguments]  ${facebook_home}
    go to  ${facebook_home}


verify user is logged in
    [Documentation]  making sure the home icon appeared on the home page after loging successfully
    get element  ${HOME_ICON_LOCATOR}

login successfully with valid username and valid password
    [Arguments]    ${email}   ${password}
    fill email field        ${email}
    fill password field     ${password}
    click on sign in button



