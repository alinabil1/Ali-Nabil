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


get all products
    Create Session  new  ${HOST}   verify=true
    ${response} =  GET On Session  new  /products
#    log to console  ${response.json()}


get product
    [Arguments]     ${product_id}
    Create Session  new  ${HOST}    verify=true
    ${response} =  GET On Session  new  /products/${product_id}
#    log to console  ${response.json()}


delete product
    [Arguments]     ${product_id}
    Create Session  new  ${HOST}    verify=true
    ${response} =  DELETE On Session  new  /products/${product_id}
#    LOG TO CONSOLE  ${response.json()}


update product



add product
    [Arguments]     ${name}  ${type}  ${price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    ${product}  create dictionary  name=${name}  type=${type}  price=${price}  shipping=${shipping}  upc=${upc}  description=${description}  manufacturer=${manufacturer}  model=${model}  url=${url}  image=${image}
    Create Session  new  ${HOST}    verify=true
    ${response} =  POST On Session  new  /products  data=${product}
    log to console  ${response.json()}
#    ${id} =  get value from json   ${response.json()}  id
#    log to console  ${id}
#    [Return]  ${id}

#    log to console  ${response.json()}

