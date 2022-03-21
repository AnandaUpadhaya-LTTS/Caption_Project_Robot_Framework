*** Settings ***
Documentation       This file handles all menu in Orange HRM
Resource        ../Base/CommonFunctionality.resource

*** Variables ***
${MYINFO_LOCATOR}       link=My Info

*** Keywords ***
Click on MyInfo
    Click Element    ${MYINFO_LOCATOR}

