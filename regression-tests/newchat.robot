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
    
    # Wait for successful login and verify we're on the AI Platform
    VerifyText              Create new chat        timeout=30s
    
    # Handle optional onboarding questions
    ${skip_visible}=        IsText                 Skip Questions    timeout=3s
    Run Keyword If          ${skip_visible}        ClickText         Skip Questions
    
    # Create new chat - using ClickElement with multiple fallback strategies
    ${clicked}=             Run Keyword And Return Status    ClickElement    xpath=//button[contains(., 'Create new chat')]
    Run Keyword Unless      ${clicked}             ClickElement    xpath=//a[contains(., 'Create new chat')]
    
    # Verify chat interface is ready
    VerifyText              Send                   timeout=10s

*** Keywords ***
Setup Browser
    [Documentation]    Opens browser and maximizes window
    Open Browser           about:blank            chrome
    SetConfig              DefaultTimeout         20s
