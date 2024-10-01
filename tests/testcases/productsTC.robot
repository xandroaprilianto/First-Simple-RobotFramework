*** Settings ***
Resource        ../../tests/keywords/memberLoginKW.robot
Resource        ../../variables/accountCollection.robot
Resource        ../keywords/productsKW.robot

*** Test Cases ***
All product should be displayed
    [Documentation]
    ...     - Ensure All Product should be displayed
    ...     - Count the number of products that appear
    Open Browser To Login Page
    Member Input Username               ${standardUser}
    Member Input Password               ${password}
    Member Clicks Login
    Member Success Login
    Products Card is Displayed
    [Teardown]    Close Browser