*** Settings ***
Resource        ../../resources/settings/globalSettings.robot
Resource        ../../variables/urlVariables.robot
Resource        ../../variables/pageObjects/loginPO.robot
Resource        ../../resources/utilities/customKeywords.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${MAIN URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${loginTitleText}      timeout=2
    Element Text Should Be    ${loginTitleText}    Swag Labs

Member Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${userNameTextField}       timeout=2
    Input Text     ${userNameTextField}        ${username}

Member Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwordTextField}       timeout=2
    Input Text     ${passwordTextField}        ${password}

Member Clicks Login
    Wait Until Element Is Visible    ${loginButton}     timeout=2
    Click Button    ${loginButton}

Member Success Login
    Wait Until Element Is Visible    ${dashboardTitleText}        timeout=2
    Element Text Should Be    ${dashboardTitleText}    Swag Labs
    Sleep    2

Login Error is Displayed
    [Arguments]     ${errorTxt}
    Arrays Elements Should Be Visible    ${userNameErrorIcon}   ${passwordErrorIcon}    ${errorMessageLogin}
    Error message is    ${errorMessageLogin}    ${errorTxt}

Error message is
    [Arguments]     ${loc}      ${errorText}
    Element Text Should Be    ${loc}    ${errorText}