*** Settings ***
Library    RequestsLibrary    #install https://pypi.org/project/robotframework-requests/

*** Variable ***
${URl}     http://thetestingworldapi.com/  #sample api dari http://thetestingworldapi.com/Help


*** Test Case ***
GET_API
    #keyword dokumentasi ada di  https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html
    Create Session     Get_Details                ${URl}
    ${response}=       GET On Session             Get_Details                api/studentsDetails/
    Log To Console     ${response.status_code}    #ada beberapa object response, dapat dilihat di dokumentasi
    #${code} =          convert to string          ${response.status_code}    #convert ke string
    Should Be Equal    ${code}                    200                        
    
    
    #Request Should Be Successful    #atau kita juga bisa menggunakan keyword ini
    
    
    
    
    
    
    
    
    
    #Should Not Contain  ${content}             "status":"false"
    #${content} =        convert to string      ${response.content}