*** Settings ***
Resource        ../../resources/settings/globalSettings.robot

*** Keywords ***
Arrays Elements Should Be Visible
    [Arguments]    @{element_locators}
    FOR    ${locator}    IN    @{element_locators}
        Element Should Be Visible    ${locator}
    END

Arrays Elements Should not Be Visible
    [Arguments]    @{element_locators}
    FOR    ${locator}    IN    @{element_locators}
        Element Should Not Be Visible   ${locator}
    END

Click Button JS
    [Arguments]     ${locator}
    Execute Javascript    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();