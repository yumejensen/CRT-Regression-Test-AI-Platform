*** Settings ***
Metadata    Organization Id    46969
Metadata    Project Id         102365
Metadata    Exploration Id     50276


# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Login
    GoTo    https://robotic.copado.com/ai/
    ClickText    Continue with email →
    TypeText    Email    ${AI_USER}
    TypeSecret    Password    ${AI_PASS}
    ClickText    LOGIN
    ClickText    Skip Questions
Connect Copado Integration
    ClickText    My Integrations
    ClickText    Connect    anchor=Connect Copado AI to your Copado CI/CD environment to interact with your DevOps pipeline using natural language. Plan sprints, manage user stories, generate and deploy code, and run quality tests directly through Copado AI agents. Learn more: .
Type in Name and API Keys  
    TypeText    Name    playground
    TypeText    API Key    ${C_PERSONAL}
    ClickText    Next Step
    ClickText    Dev1-SFP
    ClickText    Trial - Salesforce Source Format
    TypeText    Actions API Key    ${C_ACTIONS}
    ClickText    Connect    anchor=Cancel
    ClickText    Close
