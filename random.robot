# #
# # Test asset originally created using Copado QEditor.
# #

# *** Settings ***

# Library    QWeb    QForce
# Suite Setup    Open Browser    https://www.copado.com/    chrome

# *** Test Cases ***

# Find the word 'Intelligent' on copado_com
#     [Documentation]   Making the test again starting from empty test job
#     OpenBrowser       https://www.copado.com/   chrome
#     SetConfig         CaseInsensitive           True
#     VerifyAll       intelligent, INTELLIGENT, Intelligent
