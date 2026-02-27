*** Settings ***
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Login
    GoTo    https://robotic.copado.com/ai/
    ClickText    Continue with email →
    TypeText     Email    ${AI_USER}
    TypeSecret            Password    ${AI_PASS}
    ClickText             LOGIN
    VerifyText            Skip Questions    timeout=10s
    ClickText             Skip Questions
Connect Copado Integration
    VerifyText    My Integrations    timeout=10s
    ClickText     My Integrations
    VerifyText    Here you can connect Copado AI Platform to other platforms             timeout=15s
    ClickElement     xpath=(//button[contains(@class, 'btn-info')])[1]
Type in Playground Name 
    TypeText    Name    playground
Type in Personal API Key
    VerifyText          API Key    timeout=10s
    TypeText            API Key    ${C_PERSONAL}    anchor=Name
    ClickText           Next Step
Select Credentials and Project
    # 1. Click the Credential dropdown box directly
    ClickElement        xpath=//div[contains(@class, 'ng-select-container') and .//div[text()='Select a credential...']]
    VerifyText          Dev1-SFP    timeout=10s
    ClickText           Dev1-SFP
    ClickElement        xpath=//div[contains(@class, 'ng-select-container') and .//div[text()='Select a project...']]
    VerifyText          Trial - Salesforce Source Format    timeout=10s
    ClickText           Trial - Salesforce Source Format
Type in Actions API Key
    TypeText            Actions API Key    ${C_ACTIONS}
    ClickText           Connect    anchor=Cancel
Verify it is connected
    ClickText           Close
    VerifyText   Connected          timeout=15s