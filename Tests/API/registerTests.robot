*** Settings ***
Resource  ../../Resources/API.robot

*** Keywords ***


*** Test Cases ***
create user
    ${access_token}  API.get access token
    API.create user  ${access_token}