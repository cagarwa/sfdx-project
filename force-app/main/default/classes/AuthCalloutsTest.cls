@isTest
private class AuthCalloutsTest {
    @isTest static void AuthCalloutTest() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AuthHttpCalloutMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse response = AuthCallout.AuthCalloutMethod();
       
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
       
        System.assertEquals('5001U00000NNmk6QAD', response.getBody());
        System.assertEquals(200, response.getStatusCode());
     }
   }