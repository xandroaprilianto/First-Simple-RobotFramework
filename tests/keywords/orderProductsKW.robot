*** Settings ***
Resource        ../../resources/settings/globalSettings.robot
Resource        ../../resources/utilities/customKeywords.robot
Resource        ../../variables/pageObjects/productsPO.robot
Resource        ../../variables/pageObjects/cartsPO.robot
Resource        ../../variables/pageObjects/checkoutPO.robot

*** Variables ***
${getItemTitleText}
${getItemDescText}
${getItemPriceText}

*** Keywords ***
Member clicks add to cart T-Shirt
    Wait Until Element Is Visible    ${addToCartButton}
    Get product description
    Click Button    ${addToCartButton}
    Sleep    1

Get product description
    ${getProductTitleText}=     Get Text    xpath=//div[@data-test="inventory-item"][3]${productDescTitleText}
    ${getProductDescText}=      Get Text    xpath=//div[@data-test="inventory-item"][3]${productDescText}
    ${getProductPriceText}=     Get Text    xpath=//div[@data-test="inventory-item"][3]${productItemPriceText}

    Set Suite Variable    ${getItemTitleText}       ${getProductTitleText}
    Set Suite Variable    ${getItemDescText}        ${getProductDescText}
    Set Suite Variable    ${getItemPriceText}       ${getProductPriceText}

Member clicks cart button
    Wait Until Element Is Visible    ${cartsButton}
    Click Button JS    ${cartsButton}
    Sleep    2

Member success add product to cart
    Element Should Be Visible       ${pageTitleText}
    Element Text Should Be          ${pageTitleText}                Your Cart
    Element Should Be Visible       ${cartProductListCard}
    Element Text Should Be          ${cartProductTitleText}         ${getItemTitleText}
    Element Text Should Be          ${cartProductDescText}          ${getItemDescText}
    Element Text Should Be          ${cartProductPriceText}         ${getItemPriceText}
    
Member clicks checkout button
    Click Button    ${checkoutButton}
    Sleep    2

Member directed to checkout page
    Wait Until Element Is Visible       ${cartPageTitleText}
    Element Text Should Be              ${cartPageTitleText}     Checkout: Your Information
    Element Should Be Visible           ${firstNameTextField}
    Element Should Be Visible           ${lastNameTextField}
    Element Should Be Visible           ${postalCodeTextField}

Member input First Name
    [Arguments]    ${firstName}
    Wait Until Element Is Visible    ${firstNameTextField}       timeout=2
    Input Text     ${firstNameTextField}        ${firstName}

Member input Last Name
    [Arguments]    ${lastName}
    Wait Until Element Is Visible   ${lastNameTextField}       timeout=2
    Input Text     ${lastNameTextField}        ${lastName}

Member input Postal Code
    [Arguments]    ${pc}
    Wait Until Element Is Visible   ${postalCodeTextField}       timeout=2
    Input Text     ${postalCodeTextField}        ${pc}
    
Member clicks continue button
    Click Button    ${continueButton}
    Sleep    1

Member directed to checkout overview page
    Element Should Be Visible       ${pageTitleText}
    Element Text Should Be          ${pageTitleText}                Checkout: Overview
    Element Should Be Visible       ${cartProductListCard}
    Element Text Should Be          ${cartProductTitleText}         ${getItemTitleText}
    Element Text Should Be          ${cartProductDescText}          ${getItemDescText}
    Element Text Should Be          ${cartProductPriceText}         ${getItemPriceText}

    Element Should Be Visible       ${summaryInfoSection}

    Element Should Be Visible       ${paymentInformationLabelText}
    Element Text Should Be          ${paymentInformationLabelText}      Payment Information:

    Element Should Be Visible       ${paymentInfoValueText}
    Element Text Should Be          ${paymentInfoValueText}             SauceCard #31337

    Element Should Be Visible       ${shippingInformationLabelText}
    Element Text Should Be          ${shippingInformationLabelText}     Shipping Information:

    Element Should Be Visible       ${shippingInfoValueText}
    Element Text Should Be          ${shippingInfoValueText}            Free Pony Express Delivery!

    Element Should Be Visible       ${totalInfoLabelText}
    Element Text Should Be          ${totalInfoLabelText}               Price Total
    
    Element Should Be Visible       ${itemTotalInfoLabelText}
    Element Text Should Be          ${itemTotalInfoLabelText}           Item total: ${getItemPriceText}

    Element Should Be Visible       ${taxInfoLabelText}
    Element Text Should Be          ${taxInfoLabelText}                 Tax: $1.28

    Element Should Be Visible       ${totalPriceText}
    Element Text Should Be          ${totalPriceText}                   Total: $17.27
    
    Sleep    2
    
Member clicks on finish button
    Click Button    ${finishButton}
    Sleep    2

Member success checkout package
    Element Should Be Visible       ${checkoutCompleteContainer}
    Element Should Be Visible       ${imgCheckoutSuccess}
    
    Element Should Be Visible       ${completeOrderTitleText}
    Element Text Should Be          ${completeOrderTitleText}    Thank you for your order!
    
    Element Should Be Visible       ${completeOrderText}
    Element Text Should Be          ${completeOrderText}    Your order has been dispatched, and will arrive just as fast as the pony can get there!

Verify field your information is mandatory
    [Arguments]     ${param}
    Wait Until Element Is Visible       ${errorIdentityFieldText}
    ${getErrorText}=      Get Text      ${errorIdentityFieldText}
    Should Be Equal As Strings    ${getErrorText}    Error: ${param} is required

#    Reload Page
#    Element Should Be Visible       ${pageTitleText}

Clear input field your information
    Clear Element Text    ${postalCodeTextField}
    Clear Element Text    ${lastNameTextField}
    Clear Element Text    ${firstNameTextField}

Member reload page your information
    Reload Page
    Element Should Be Visible       ${pageTitleText}


