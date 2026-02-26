*** Settings ***
Library                 QWeb
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

Create New Chat 
    # Wait for successful login and verify we're on the AI Platform
    VerifyItem              Create new chat        timeout=30s
    ClickItem               Create new chat

Send Message  
    # VerifyElement    //textarea[@placeholder\='How can I help you today?']    20
    # ClickElement            id=ai-prompt-input
    # TypeText    Hello    ai-prompt-input
    # # TypeText     Hello   ai-prompt-input

    # # ClickText    ai-prompt-input
    ClickCoordinates        600                    300
    TypeText                ai-prompt-input                ${MESSAGE}

    # TypeText                Input                  ${MESSAGE}
    ClickText            ai-prompt-send
    



*** Keywords ***
Setup Browser
    [Documentation]    Opens browser and maximizes window
    Open Browser           about:blank            chrome
    SetConfig              DefaultTimeout         20s
    SetConfig              ShadowDOM              True