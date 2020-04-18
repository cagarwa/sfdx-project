public class ProjectCalloutServiceMock implements HttpCalloutMock {
   //Implement http mock callout here
     public HTTPResponse respond(HTTPRequest request) {
      HttpResponse response = new HttpResponse();
      response.setHeader('Content-Type', 'application/json');
      response.setStatus('Created');
      response.setStatusCode(201);
      return response; 
       
  }  
}