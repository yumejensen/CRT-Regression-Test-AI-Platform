*** Settings ***
Library                 QForce
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
    ClickElement     xpath=(//button[contains(@class, 'btn-info')])[2]
    
    # # Wait for Salesforce login page to appear (may open in new window)
    # ${new_window}=          IsText                 Username         timeout=5s
    # IF                      ${new_window}
    #     # If opened in new window, switch to it
    #     SwitchWindow        NEW
    # END
    
    # # Enter Salesforce credentials
    # VerifyText              Username               timeout=10s
    # TypeText                Username               ${SF_USER}
    # TypeSecret              Password               ${SF_PASS}
    # ClickText               Log In
    
    # # Handle OAuth authorization page
    # VerifyText              Allow                  timeout=15s
    # VerifyText              will be able to       timeout=5s
    
    # # Click Allow button to authorize the integration
    # ClickText               Allow
    
    # # Verify successful integration
    # VerifyText              Successfully connected    timeout=10s