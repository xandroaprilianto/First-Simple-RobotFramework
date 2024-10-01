*** Settings ***
Resource        ../../resources/settings/globalSettings.robot
Resource        ../../resources/utilities/customKeywords.robot
Resource        ../../variables/pageObjects/productsPO.robot

*** Keywords ***
Products Card is Displayed
    ${count}=   Get Element Count    ${productCard}
    Should Be True    ${count} > 0    Not all inventory items displayed
    Log    ${count} product is Displayed