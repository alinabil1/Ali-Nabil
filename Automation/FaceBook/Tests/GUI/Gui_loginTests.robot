*** Settings ***
Documentation       A test suite for login.
Resource            ../../Resources/Common.robot
Resource            ../../Resources/PO/Login.robot
Library             robot.libraries.DateTime

Default Tags      smoke

Test Setup   common.begin Web Test

*** Variables ***
# user data
@{email} =  ali_grafkpv_nabil@tfbnw.net     test@test.com
@{password} =  Ya12345678   12345678
@{msg}  The password that you've entered is incorrect.  We couldn't find an account that matches what you entered, but we've found one that closely matches.


# test setup data
${FACEBOOK_BASE_URL} =  https://facebook.com
${browser} =  chromium


*** Test Cases ***

verify user can sign in with vaild credintials
    [Documentation]     verify user can login using a valid email and a valid password
    [Tags]  smoke
    login.go to login page  ${FACEBOOK_BASE_URL}
    login.fill email field  ${email[0]}
    login.fill password field  ${password[0]}
    login.click on sign in button
    login.verify user is logged in


verify user can't login with valid email and invalid password
    login.go to login page  ${FACEBOOK_BASE_URL}
    login.fill email field  ${email[0]}
    login.fill password field  ${password[1]}
    login.click on sign in button
    get text    text=${msg[0]}


verify user can't login without entering a password
    login.go to login page  ${FACEBOOK_BASE_URL}
    login.fill email field  ${email[0]}
    login.click on sign in button
    get text    text=${msg[0]}


verify user can't login with a not registed email
    [Documentation]     verify user can't login using an invalid email
    [Tags]  smoke
    login.go to login page  ${FACEBOOK_BASE_URL}
    login.fill email field  ${email[1]}
    login.fill password field  ${password[0]}
    login.click on sign in button
    get text    text=${msg[1]}
