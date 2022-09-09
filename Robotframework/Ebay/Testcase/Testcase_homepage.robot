############# MANDATORY INCLUDES #############


*** Settings ***
Resource         ../resources/PageImporter.robot
Test Setup       Open Browser With Timeout
Test Teardown    Close Browser


*** Test Case ***
Access a Product Via Category
    [Documentation]                            As user, I want to ...
    Homepage.Navigate to Search by category    Cell phones & accessories
    Homepage.Go To Specific Category           Cell Phones & Smartphones
    Homepage.Add 3 Filters
    Homepage.Verify Filter Tags


Access a Product via Search
    [Documentation]                            As user, I want to ...
    Homepage.Search Product                    MacBook
    Homepage.Search Product By Category
    Homepage.Verify Search Page




