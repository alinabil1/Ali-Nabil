*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     BuiltIn
Library     robot.libraries.String

*** Variables ***
${HOST}     http://localhost:3030

*** Keywords ***
get products with limit
    [Arguments]  ${limit}
    Create Session  new  ${HOST}   verify=true
    ${response} =  GET On Session  new  /products   params=$limit=${limit}
    log to console  ${response.json()}
    [Return]  ${response.json()}


get all products
    Create Session  new  ${HOST}   verify=true
    ${response} =  GET On Session  new  /products
#    log to console  ${response.json()}


get product
    [Arguments]     ${product_id}
    Create Session  new  ${HOST}    verify=true
    ${response} =  GET On Session  new  /products/${product_id}
    log to console  ${response.json()}
    [Return]  ${response.json()}


delete product
    [Arguments]     ${product_id}
    Create Session  new  ${HOST}    verify=true
    ${response} =  DELETE On Session  new  /products/${product_id}
    LOG TO CONSOLE  ${response.json()}


update product
    [Arguments]   ${product_id}  ${name}  ${type}  ${price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    ${product}  create dictionary  name=${name}  type=${type}  price=${price}  shipping=${shipping}  upc=${upc}  description=${description}  manufacturer=${manufacturer}  model=${model}  url=${url}  image=${image}
    Create Session  new  ${HOST}    verify=true
    ${response} =  PATCH On Session     new     /products/${product_id}     json=${product}
    log to console  ${response.json()}
    [Return]  ${response.json()}


add product
    [Arguments]   ${name}  ${type}  ${price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    ${product}  create dictionary  name=${name}  type=${type}  price=${price}  shipping=${shipping}  upc=${upc}  description=${description}  manufacturer=${manufacturer}  model=${model}  url=${url}  image=${image}
    Create Session  new  ${HOST}    verify=true
    ${response} =  POST On Session      new     /products     json=${product}
    log to console  ${response.json()}
    ${ids} =  get value from json   ${response.json()}  id
    ${id} =   Get From List    ${ids}    0
    [Return]  ${id}


