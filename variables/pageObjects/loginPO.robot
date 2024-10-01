*** Variables ***
${loginTitleText}           //div[@class="login_logo"]
${userNameTextField}        //input[@id="user-name"]
${passwordTextField}        //input[@id="password"]
${loginButton}              //input[@id="login-button"]
${dashboardTitleText}       //div[@class="app_logo"]
#Error Element
${userNameErrorIcon}        //input[@id='user-name']/following-sibling::*[name()='svg']
${passwordErrorIcon}        //input[@id="password"]/following-sibling::*[name()='svg']
${errorMessageLogin}        //h3[@data-test="error"]
