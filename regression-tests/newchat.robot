*** Settings ***
Library                 QForce
Suite Setup             Setup Browser
Suite Teardown          Close All Browsers

*** Variables ***
${LOGIN_URL}            https://robotic.copado.com/ai/
${PROMPT_INPUT}         xpath=//div[@id='ai-prompt-input']
${PROMPT_SEND}          xpath=//button[@id='ai-prompt-send']

*** Keywords ***
Setup Browser
    Open Browser        ${LOGIN_URL}    chrome
    Set Window Size     1920    1080

*** Test Cases ***
Login on CopadoAI
    # Login Flow (Standard steps you confirmed work)
    ClickText                   Continue with email →
    TypeText                    Email                  ${AI_USER}
    TypeSecret                  Password               ${AI_PASS}
    ClickText                   LOGIN
Skip Response      
    # Navigation
    ClickText                   Skip Questions         timeout=25s
    ClickText                   New Chat               timeout=20s

Enter Prompt    
    # 1. Action
    ClickElement                ${PROMPT_INPUT}        timeout=30s
    TypeText                    ${PROMPT_INPUT}        Hi
    ClickElement                ${PROMPT_SEND}         timeout=10s

Wait and Screenshot Response    
    # 2. Verify AI is responding
    VerifyText                  Stop generating        timeout=15s
    VerifyNoText                Stop generating        timeout=60s
    
    # 3. EVIDENCE (The Spacing Fix)
    # Use the Tab key between the command and the filename
    Sleep                       30s
    LogScreenshot               ai_results.png
