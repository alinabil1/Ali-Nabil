*** Settings ***
Resource  ../endPoints/Api.robot

*** Variables ***
${name} =  name
${type} =  type
${price} =  100
${shipping} =  0
${upc} =  string
${description} =  desc
${manufacturer} =  man
${model} =  1990
${image}  = image
${url}  =  https

*** Test Cases ***

verify admin can add a product to product list
    ${price}  convert to integer  ${price}
    ${shipping}  convert to integer  ${shipping}
    ${product_id}  Api.add product  ${name}  ${type}  ${price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    Api.get product  ${product_id}

verify admin can update product details
    [Documentation]  this test changes the price of product after creating the product
    ${init_price}  convert to integer  ${price}
    ${shipping}  convert to integer  ${shipping}
    ${product_id}  Api.add product  ${name}  ${type}  ${init_price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    ${price_update}  evaluate  ${price} - 10
    ${response}  Api.update product  ${product_id}  ${name}  ${type}  ${price_update}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    ${product_details}  api.get product  ${product_id}
    ${prices} =  get value from json   ${product_details}  price
    ${price_after_update} =   Get From List    ${prices}    0
    should be equal as integers  ${price_after_update}  ${price_update}


verify user can get list of products paginated
    [Documentation]  this test gets the products list paginated with the limit sent in the request
    ${response}  Api.get products with limit     10
    ${limit_list}    get value from json  ${response}    limit
    ${limit}    get from list  ${limit_list}    0
    should be equal as numbers  ${limit}    10

verify user can delete product
    [Documentation]  this test creates a product then deletes it
    ${init_price}  convert to integer  ${price}
    ${shipping}  convert to integer  ${shipping}
    ${product_id}  Api.add product  ${name}  ${type}  ${init_price}   ${shipping}   ${upc}   ${description}   ${manufacturer}   ${model}  ${url}   ${image}
    api.delete product  ${product_id}












