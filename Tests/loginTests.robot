*** Settings ***
Documentation       A test suite for login.
Resource            ../Resources/Common.robot
Resource            ../SSO/Login.robot
Library             robot.libraries.DateTime

Default Tags      smoke

Test Setup   common.begin Web Test

*** Variables ***
# user data
${username} =  aliii nabilll
${firstName} =  ali
${lastName} =  nabil
${email} =  ali_grafkpv_nabil@tfbnw.net
${password} =  Ya12345678

# test setup data
${FACEBOOK_BASE_URL} =  https://facebook.com
${browser} =  chromium


*** Test Cases ***

verify user can sign in with vaild credintials
    [Documentation]     verify user can login using a valid email and password
    [Tags]  smoke
    login.go to login page  ${FACEBOOK_BASE_URL}
    login.fill email field  ${email}
    login.fill password field  ${password}
    login.click on sign in button
    login.verify user is logged in

verify user can't login with invalid email

verify user can't login with valid email and invalid password

verify user can't login without entering a password