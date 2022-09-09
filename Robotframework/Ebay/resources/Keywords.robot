Resource                           ../PageImporter.robot

*** Variable ***


*** Keywords ***

VirtualDisplay
    Start Virtual Display                    2560                                                              1440

Open Browser With Timeout
    [Timeout]                                120 Second
    Open Browser                             ${HOME URL}?google_nofetch=1                                      ${BROWSER}
    Sleep                                    5

Open Browser To Login Page
    [Timeout]                                300 Second
    Open Browser                            ${LOGIN URL}                                                      ${BROWSER}
    #Execute Javascript                       window.stop()
    Sleep                                    5
    Keywords.Push Notif Closer


Open Browser With Blank URL
    [Timeout]                                120 Second
    Open Browser                             about:blank                                                       ${BROWSER}
    Sleep                                    5
    Keywords.Push Notif Closer


Scroll To Element
    [Arguments]                              ${element}
    Wait Until Page Contains Element         ${element}                                                        timeout=3                                                                 error=There's no ${element}
    ${ver}=                                  Get Vertical Position                                             ${element}
    Execute Javascript                       window.scrollTo(0,${ver}-90)
    Sleep                                    1