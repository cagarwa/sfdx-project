public class AuthCallout {
  
     public static HttpResponse AuthCalloutMethod(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:My_Named_Credentials/services/apexrest/Cases');
        req.setMethod('PUT');
        req.setHeader('Content-Type', 'application/json');
        req.setbody('{"subject":"mighty moose1"}');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode()== 200){
          //System.assertEquals(true,false,res);
          return null;
        }
        else{
          return res;
        }
     }
 }