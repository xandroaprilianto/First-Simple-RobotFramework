*** Settings ***
Resource        ../../tests/keywords/memberLoginKW.robot
Resource        ../../variables/accountCollection.robot
Resource    ../keywords/orderProductsKW.robot

*** Test Cases ***
Member can add product to cart
    [Documentation]
    ...     - Member add product to cart
    ...     - Make sure the product in the cart matches the product is selected
    Open Browser To Login Page
    Member Input Username                   ${standardUser}
    Member Input Password                   ${password}
    Member Clicks Login
    Member Success Login
    Member clicks add to cart T-Shirt
    Member clicks cart button
    Member success add product to cart
    [Teardown]    Close Browser

Member success checkout product
    [Documentation]
    ...     - Member success checkout product
    Open Browser To Login Page
    Member Input Username                           ${standardUser}
    Member Input Password                           ${password}
    Member Clicks Login
    Member Success Login
    Member clicks add to cart T-Shirt
    Member clicks cart button
    Member success add product to cart
    Member clicks checkout button
    Member directed to checkout page
    Member input First Name                         Quality Assurance
    Member input Last Name                          Automation
    Member input Postal Code                        99100
    Member clicks continue button
    Member directed to checkout overview page
    Member clicks on finish button
    Member success checkout package
    [Teardown]    Close Browser

Member failed checkout product when information first name is empty
    [Documentation]
    ...     - Member success checkout product
    ...     - Loop every invalid member
    Open Browser To Login Page
    Member Input Username                           ${standardUser}
    Member Input Password                           ${password}
    Member Clicks Login
    Member Success Login
    Member clicks add to cart T-Shirt
    Member clicks cart button
    Member success add product to cart
    Member clicks checkout button
    Member directed to checkout page
    FOR    ${invalidMember}    IN    @{INVALID_MEMBERS}
        Member input First Name                         ${invalidMember['firstname']}
        Member input Last Name                          ${invalidMember['lastname']}
        Member input Postal Code                        ${invalidMember['postalcode']}
        Member clicks continue button
        Verify field your information is mandatory      ${invalidMember['mandatoryField']}
        Member reload page your information
    END
    [Teardown]      Close Browser
