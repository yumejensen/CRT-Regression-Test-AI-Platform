*** Settings ***
Library                 QForce
Suite Setup             Setup Browser
Suite Teardown          Close All Browsers

*** Variables ***
${LOGIN_URL}           https://robotic.copado.com/ai

*** Test Cases ***
Login To Copado AI Platform
    [Documentation]    Navigate to Copado AI Platform, login with email, and create new chat
    [Tags]             login    ai-platform
    
    # Navigate directly to Copado AI Platform
    GoTo                    ${LOGIN_URL}
    VerifyText              Continue with email    timeout=10s
    
    # Login with email
    ClickText               Continue with email
    VerifyText              Email                  timeout=5s
    TypeText                Email                  ${AI_USER}
    TypeSecret              Password               ${AI_PASS}
    ClickText               LOGIN
    ClickText               Skip Questions
    
    # Click onto Workspace Details
    VerifyItem              Workspace Details
    ClickItem              Workspace Details

*** Keywords ***
Setup Browser
    [Documentation]    Opens browser and maximizes window
    Open Browser           about:blank            chrome
    SetConfig              DefaultTimeout         20s
    SetConfig              ShadowDOM              True
