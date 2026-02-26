*** Settings ***
Library                 QForce
Suite Setup             Setup Browser
Suite Teardown          Close All Browsers

*** Variables ***
${LOGIN_URL}           https://robotic.copado.com/ai

*** Test Cases ***
Login To Copado AI Platform
    [Documentation]    Navigate to Copado Robotic Testing, login with email, and access AI Platform
    [Tags]             login    ai-platform
    
    # Navigate to Copado Robotic Testing
    GoTo                    ${LOGIN_URL}
    VerifyText              Continue with email    timeout=10s
    
    # Login with email
    ClickText               Continue with email
    VerifyText              Email                  timeout=5s
    TypeText                Email                  ${AI_EMAIL}
    TypeSecret              Password               ${AI_PASS}
    ClickText               LOGIN
    
    # Wait for successful login - verify we're on the main page
    VerifyText              app-switcher           timeout=30s
    
    # Switch to new window
    SwitchWindow            NEW
    
    # Handle onboarding and create new chat
    ${skip_visible}=        IsText                 Skip Questions    timeout=3s
    Run Keyword If          ${skip_visible}        ClickText         Skip Questions
    
    VerifyText              Create new chat        timeout=10s
    ClickText               Create new chat
    
    # Verify chat is ready
    VerifyText              Send                   timeout=10s

*** Keywords ***
Setup Browser
    [Documentation]    Opens browser and maximizes window
    Open Browser           about:blank            chrome
    SetConfig              DefaultTimeout         20s
