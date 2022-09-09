*** Settings ***
Resource                          ../PageImporter.robot


*** Variable ***
${SHOP_BY_CATEGORY_BUTTON}        id=gh-shop-a
${SUBCATEGORY_LIST}               xpath=//tbody/tr/td[1]/ul
${SUBCATEGORY_NAVIGATION_LIST}    xpath=//ul/li
${FILTER_TAGS}                    //span[@data-aspecttype]
${SEARCH_BUTTON}                  xpath=//*[@id="gh-btn"]

*** Keywords ***
Navigate to Search by category
    [Arguments]                         ${text}
    Click Element                       ${SHOP_BY_CATEGORY_BUTTON}
    Sleep                               1
    Click Element                       ${SUBCATEGORY_LIST}//a[text()='${text}']
    #Click Element                      xpath=//*[contains(text(),'${SubCategory}')]

Go To Specific Category
    [Arguments]                         ${text}
    Click Element                       ${SUBCATEGORY_NAVIGATION_LIST}/a[text() = '${text}']
    ${str}=                             Replace String                                                                ${text}                                     ${space}&    ${empty}
    ${str}=                             Replace String                                                                ${str}                                      ${space}     -
    Wait Until Location Contains        ${str}

Add 3 Filters
    Keywords.Scroll To Element          xpath=//section/ul[1]//button[text()='All Filters']
    Click Element                       xpath=//section/ul[1]//button[text()='All Filters']
    Sleep                               10
    Click Element                       xpath=//div[@role="tab"]/span[text()="Screen Size"]
    Sleep                               3
    Click Element                       xpath=//fieldset/div[1]/div[1]
    Sleep                               3
    Click Element                       xpath=//div[@role="tab"]/span[text()="Price"]
    Sleep                               3
    Input Text                          xpath=//div/div[1]/div/input[@aria-label="Minimum Value, US Dollar"]          0
    Input Text                          xpath=//div/div[2]/div/input[@aria-label="Maximum Value, US Dollar"]          10000
    Click Element                       xpath=//div[@role="tab"]/span[text()="Item Location"]
    Sleep                               10
    Click Element                       xpath=//span/span/input[@aria-label="Asia"]

Verify Filter Tags
    Homepage.Count Element
    #Click Element                           xpath=//form/div[3]/div/button[text()="Apply"]
    Click Element                       class=x-overlay-footer__apply
    Sleep                               10
    Wait Until Element Is Visible       xpath=//*[@id="s0-27_1-9-0-1[0]-0-0-6-5-4[0]-flyout"]/button/span

Count Element
    ${count_element}                    Execute Javascript                                                            return $("span[data-aspecttype]").length
    Set Test Variable                   ${count_element}
    Should Be True                      ${count_element} > 0

Search Product
    [Arguments]                         ${text}
    Input Text                          xpath=//tbody/tr/td[1]/div[1]/div/input[@aria-label="Search for anything"]    ${text}
    Click Element                       ${SEARCH_BUTTON}

Search Product By Category
    Click Element                       //*[@id="gh-cat"]/option[text()= " Computers/Tablets & Networking"]
    Click Element                       ${SEARCH_BUTTON}

Verify Search Page
    Wait Until Page Contains Element    xpath=//li/ul/li[1]/span[text()="Computers/Tablets & Networking"]
    Wait Until Page Contains            MacBook