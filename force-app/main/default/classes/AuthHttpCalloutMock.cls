@isTest
global class AuthHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"Case": {"Id":"5001U00000NNmk6QAD"}}');
        response.setStatusCode(200);
        return response; 
    }
}