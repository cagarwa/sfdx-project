global class BillingCalloutServiceMock  implements WebServiceMock{

        global void doInvoke(
                   Object stub,
                   Object request,
                   Map<String, Object> response,
                   String endpoint,
                   String soapAction,
                   String requestName,
                   String responseNS,
                   String responseName,
                   String responseType) {
                // start - specify the response you want to send
                BillingServiceProxy.billProjectResponse_element  response_x =  new BillingServiceProxy.billProjectResponse_element();
                       response_x.status = 'Success';
                // end
                response.put('response_x', response_x); 
           }
   //Implement http mock callout here
}