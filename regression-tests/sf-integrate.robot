*** Settings ***
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***
Login To Copado AI Platform
    # Navigate directly to Copado AI Platform
    GoTo                    https://robotic.copado.com/ai/
    VerifyText              Continue with email    timeout=10s
    
    # Login with email
    ClickText               Continue with email →
    TypeText                Email                  ${AI_USER}
    TypeSecret              Password               ${AI_PASS}
    ClickText               LOGIN
    VerifyText              Skip Questions    timeout=10s
    ClickText               Skip Questions

Verify the My Integrations Page
    # Navigate to My Integrations
    VerifyText              My Integrations      timeout=10s
    ClickText               My Integrations
    
Click on Integration button for SF
    # Verify Integrations page
    VerifyText    Here you can connect Copado AI Platform to other platforms             timeout=15s
    ClickText     Connect    anchor=Salesforce    timeout=10s
    LogScreenshot
Connect to Salesforce
    VerifyText    Connect Salesforce Integration
    TypeText    Name    playground
    ClickText           Connect    index = 2    timeout=10s
    LogScreenshot
    
Enter Salesforce credentials
    VerifyText              Username               timeout=10s
    TypeText                Username               ${SF_USER}
    TypeSecret              Password               ${SF_PASS}
    ClickText               Log In
    LogScreenshot
    
Click Allow button to authorize the integration
    ClickText               Allow                 index = 4
    
