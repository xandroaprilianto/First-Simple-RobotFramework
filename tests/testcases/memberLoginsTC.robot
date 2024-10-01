*** Settings ***
Resource        ../../tests/keywords/memberLoginKW.robot
Resource        ../../variables/accountCollection.robot

*** Test Cases ***
Success Login with Standard User
    [Documentation]
    ...     - Standard user successfully login
    Open Browser To Login Page
    Member Input Username               ${standardUser}
    Member Input Password               ${password}
    Member Clicks Login
    Member Success Login
    [Teardown]    Close Browser

Password field is required
    [Documentation]
    ...     - Failed to login when password is empty/null (Password field is mandatory)
    Open Browser To Login Page
    Member Input Username               ${standardUser}
    Member Input Password               ${EMPTY}
    Member Clicks Login
    Login Error is Displayed            Epic sadface: Password is required
    [Teardown]    Close Browser

Failed Login when username is required
    [Documentation]
    ...     - Failed to login when username is empty/null (Username field is mandatory)
    Open Browser To Login Page
    Member Input Username               ${EMPTY}
    Member Input Password               ${password}
    Member Clicks Login
    Login Error is Displayed            Epic sadface: Username is required
    [Teardown]    Close Browser

Failed to log in using a locked account
    [Documentation]
    ...     - Failed to log in using a locked account
    Open Browser To Login Page
    Member Input Username               ${lockedOutUser}
    Member Input Password               ${password}
    Member Clicks Login
    Login Error is Displayed            Epic sadface: Sorry, this user has been locked out.
    [Teardown]    Close Browser