*** Settings ***
Metadata    Organization Id    46969
Metadata    Project Id         102365
Metadata    Exploration Id     50276


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
    LogScreenshot
    VerifyText            Skip Questions    timeout=10s
    ClickText             Skip Questions
Connect Copado Integration
    VerifyText    My Integrations    timeout=10s
    ClickText    My Integrations
    LogScreenshot
    ClickText    Connect    anchor=Connect Copado AI to your Copado CI/CD environment
Type in Playground Name 
    LogScreenshot
    TypeText    Name    playground
Type in Personal API Key
    LogScreenshot
    VerifyText          API Key    timeout=10s
    TypeText            API Key    ${C_PERSONAL}    anchor=Copado API Key
    ClickText           Next Step
Select Credentials and Project
    LogScreenshot
    ClickText    Select a credential...
    ClickText           Dev1-SFP
    ClickText    Select a project...
    ClickText           Trial - Salesforce Source Format
Type in Actions API Key
    TypeText            Actions API Key    ${C_ACTIONS}
    ClickText           Connect    anchor=Cancel
Verify it is connected
    ClickText           Close
    VerifyText   Connected          timeout=15s
