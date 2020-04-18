public class ParkLocator {
    public static String[]  country (String country){
        List<String> vParkList  = new List<String>();
       
            ParkService.ParksImplPort  vParkImpClass  = new ParkService.ParksImplPort();
            vParkList = vParkImpClass.byCountry(country);
           
        
         return vParkList;    
    }
        
}