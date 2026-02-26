# Automatically generated from Exploration Copado AI SF Integration (ID 50278) on Feb 26, 2026, 20:03:58 UTC. This is one time conversion.

# Generated from Exploration https://robotic.copado.com/explorations/50278/summary?projectId=102365&orgId=46969&view=details

*** Settings ***
Metadata    Organization Id    46969
Metadata    Project Id         102365
Metadata    Exploration Id     50278


# You can change imported library to "QWeb" if testing generic web application, not Salesforce.
Library                 QForce
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Test Cases ***

Test case
    GoTo    https://robotic.copado.com
    ClickText    Continue with email →
    TypeText    Email    Choust4@lsu.edu
    TypeSecret    Password    [enter password here]
    ClickText    LOGIN
    ClickElement    /html[1]/body[1]/app-root[1]/ng-component[1]/div[1]/div[1]/app-sidebar[1]/div[1]/div[1]/div[1]/cds-app-switcher[1]/div[1]/button[1]
    ClickText    Copado AI Platform
    SwitchWindow    NEW
    ClickText    Skip Questions
    ClickText    Workspace Details
    ClickText    Integrations    partial_match=False
    ClickText    Connect    anchor=Connect your Salesforce org to the Copado AI Platform to analyze metadata,\n generate Apex code, and run tests using natural language. No full CI/CD setup required.\n Ideal for metadata-only projects or evaluations, this integration helps you build production-ready solutions tailored to your org.
    TypeText    Name    yjensen@copado.com.playground
    ClickText    Connect    anchor=Cancel
    TypeText    Username    yjensen@copado.com.playground
    TypeSecret    Password    [enter password here]
    ClickText    Log In
    TypeText    Verification Code    955474
    ClickText    Verify
    # Log into Copado AI Platform.

Go to Workspace Details

Press the Connect button under the Salesforce tab, not the Copado CICD tab.

Type in the name and then connect.

When redirected to the Salesforce login, add in the credentials and bypass the verification.

Allow to OAuth verification to connect the workspace and the playground together.
    ClickText    Allow