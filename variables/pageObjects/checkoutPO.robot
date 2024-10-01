*** Variables ***
#Page Checkout: Your Information
${pageTitleText}                    //span[@data-test="title"]
${firstNameTextField}               //input[@data-test="firstName"]
${lastNameTextField}                //input[@data-test="lastName"]
${postalCodeTextField}              //input[@data-test="postalCode"]
${continueButton}                   //input[@data-test="continue"]
${errorIdentityFieldText}           //h3[@data-test="error"]
${closeErrorButton}                 //button[@data-test="error-button"]

#Page Checkout: Overview
${summaryInfoSection}               //div[@class="summary_info"]
${paymentInformationLabelText}      //div[@data-test="payment-info-label"]
${paymentInfoValueText}             //div[@data-test="payment-info-value"]
${shippingInformationLabelText}     //div[@data-test="shipping-info-label"]
${shippingInfoValueText}            //div[@data-test="shipping-info-value"]
${totalInfoLabelText}               //div[@data-test="total-info-label"]
${itemTotalInfoLabelText}           //div[@data-test="subtotal-label"]
${taxInfoLabelText}                 //div[@data-test="tax-label"]
${totalPriceText}                   //div[@data-test="total-label"]
${finishButton}                     //button[@data-test="finish"]

#Page Checkout: Complete
${checkoutCompleteContainer}        //div[@data-test="checkout-complete-container"]
${imgCheckoutSuccess}               //img[@data-test="pony-express"]
${completeOrderTitleText}           //h2[@data-test="complete-header"]
${completeOrderText}                //div[@data-test="complete-text"]