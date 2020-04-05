public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer vNumberOfContacts, String vLastName){
        List<Contact> vConList = new List<Contact>();
        for(Integer i=0;i<vNumberOfContacts;i++){
            vConList.add(new Contact(FirstName = 'Test'+i, LastName =vLastName) );
        }
        
        return vConList;
    }
}