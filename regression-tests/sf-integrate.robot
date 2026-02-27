*** Settings ***
Library                 QForce
Suite Setup             Setup Browser
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

    # # Skip onboarding questions if present
    # ${skip_visible}=        IsText                 Skip Questions    timeout=3s
    # IF                      ${skip_visible}
    #     ClickText           Skip Questions
    # END
    
    # Navigate to My Integrations
    VerifyText              My Integrations      timeout=10s
    ClickText               My Integrations
    
    # Verify Integrations page
    VerifyText    Here you can connect Copado AI Platform to other platforms             timeout=
    ClickElement     xpath=(//button[contains(@class, 'btn-info')])[1]
    
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

*** Keywords ***
Setup Browser
    [Documentation]    Opens browser with optimal settings for Salesforce integration
    Open Browser           about:blank            chrome
    SetConfig              DefaultTimeout         20s
    SetConfig              ShadowDOM              True
    Maximize Window