*** Variables ***
# Username
${standardUser}                 standard_user
${lockedOutUser}                locked_out_user
${problemUser}                  problem_user
${performanceGlitchUser}        performance_glitch_user
${errorUser}                    error_user
${visualUser}                   visual_user
# Password
${password}                     secret_sauce
${invalidPassword}              secretSauce

#Invalid account
&{firstNameInvalid}     mandatoryField=First Name      firstname=${EMPTY}      lastname=Automation      postalcode=99100
&{lastNameInvalid}      mandatoryField=Last Name       firstname=QA            lastname=${EMPTY}        postalcode=99100
&{postalCodeInvalid}    mandatoryField=Postal Code     firstname=QA            lastname=Automation      postalcode=${EMPTY}

@{INVALID_MEMBERS}      &{firstNameInvalid}     &{lastNameInvalid}      &{postalCodeInvalid}
