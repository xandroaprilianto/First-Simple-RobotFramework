**Robot Framework - Simple Checkout Product**

I have 3 Scenario 
1. Login Scenario
2. Products
3. Order Product

Login Scenario TestCase
1. Success Login with Standard User
2. Failed to login when password is empty/null (Password field is mandatory)
3. Failed to login when username is empty/null (Username field is mandatory)
4. Failed to log in using a locked account

Products
1. Validate all products appearing and count the number of products appearing

Order Products
1. Member can add product to cart
2. Member success checkout product
3. Member failed checkout product when information first name is empty



**How to Run**

Run all : robot -d log --loglevel TRACE .\tests\
Run spesific file : robot -d log --loglevel TRACE .\tests\testcases\memberLoginsTC.robot

Just change memberLoginsTC.robot to run spesific file
