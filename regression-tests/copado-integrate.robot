*** Settings ***
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Variables ***
${THREE_DOTS_MENU}    xpath=//cds-icon[@shape='SystemAndDevicesDotsThreeRegularVerticalSolid']
${DISCONNECT_BTN}     xpath=//button[contains(@class, 'btn-danger')]

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
Disconnect the Integration
    VerifyElement    ${THREE_DOTS_MENU}    timeout=10s
    ClickElement    ${THREE_DOTS_MENU}
    VerifyText      Disconnect Integration    timeout=10s
    ClickText       Disconnect Integration
    VerifyElement   ${DISCONNECT_BTN}           timeout=5s
    ClickElement    ${DISCONNECT_BTN}
Verify it is disconnected
    VerifyText    Integration disconnected successfully    timeout=10s
