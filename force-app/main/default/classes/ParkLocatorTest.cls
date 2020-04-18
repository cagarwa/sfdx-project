@isTest
public class ParkLocatorTest {
   @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        
        List<String> actualResult = ParkLocator.country('India');
        List<String> expectedResult =new List<String>{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        // Verify that a fake result is returned
        System.assertEquals(expectedResult, actualResult); 
       
        actualResult = ParkLocator.country('Japan');
        //System.assertEquals(null, actualResult); 
       
       
    }
}