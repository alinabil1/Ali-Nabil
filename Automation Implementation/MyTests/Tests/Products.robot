*** Settings ***
Resource  ../endPoints/Api.robot

*** Variables ***
${name} =  name
${type} =  type
${price} =  0
${shipping} =  0
${upc} =  string
${description} =  desc
${manufacturer} =  man
${model} =  12
${image}  = image
${url}  =  https

*** Test Cases ***
yomna


    ${product_id}  Api.add product  ${name}  ${type}  ${price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
#    Api.get product     ${product_id}
#    Api.delete product  ${product_id}
