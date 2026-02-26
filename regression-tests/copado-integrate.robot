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
    ClickText             Skip Questions
Connect Copado Integration
    ClickText    My Integrations
    LogScreenshot
    ClickText    Connect    anchor=Copado
Type in Name and API Keys  
    LogScreenshot
    TypeText    Name    playground
    LogScreenshot
    VerifyText          API Key    timeout=20s
    TypeText            API Key    ${C_PERSONAL}    anchor=Copado API Key
    ClickText           Next Step
    ClickText           Dev1-SFP
    ClickText           Trial - Salesforce Source Format
    TypeText            Actions API Key    ${C_ACTIONS}
    ClickText           Connect    anchor=Cancel
    ClickText           Close
