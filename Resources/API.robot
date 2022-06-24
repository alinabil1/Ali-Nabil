*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     BuiltIn
Library     robot.libraries.String

*** Variables ***
${CREATE_USER_ENDPOINT} =  /1290033114856818/accounts/test-users
${HOST} =  https://graph.facebook.com
${app_id} =  1290033114856818
${PATH} =   /oauth/access_token?client_id=1290033114856818&client_secret=4bf507f89c7746cb6dd1dc39103defb2&grant_type=client_credentials
#${SSO_ADMIN_ENDPOINT} =  /auth/realms/Variiance/protocol/openid-connect/token
#${SSO_REGISTER_ENDPOINT} =  /auth/admin/realms/Variiance/users
#${ERP_BASE_URL} =   https://erpdev.variiance.com/
#${API_LAYER_BASE_URL} =  https://api.vdev.variiance.com/


*** Keywords ***
get access token
    Create Session  new  ${HOST}   verify=true
    ${response} =  GET On Session  new  ${PATH}
    ${access_token_list} =  get value from json  ${response.json()}    access_token
    ${access_token} =   Get From List    ${access_token_list}    0
    log to console  ${access_token}
    [Return]    ${access_token}

create user
    [Arguments]  ${access_token}
    Create Session  new  ${HOST}   verify=true
    ${response} =  POST On Session  new  ${CREATE_USER_ENDPOINT}    params=access_token=${access_token}
    log to console  ${response.json()}
