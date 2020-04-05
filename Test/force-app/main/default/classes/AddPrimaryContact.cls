public class AddPrimaryContact implements Queueable {
    private String state;
    private Contact vContact;
    public AddPrimaryContact(Contact vContact, String State){
        this.vContact = vContact;
        this.state = State;
    }
    
    public void execute(QueueableContext context) {
        List<Account> vAccountList = [Select Id, BillingState From Account where BillingState=:state Limit 200];
        List<Contact> vContactList = new List<Contact>();
        for(Account vAccount : vAccountList ) {
            Contact vCloneContact = vContact.clone(false, false, false, false);
            vCloneContact.AccountId = vAccount.Id;
            vContactList.add(vCloneContact);
        }
        
        if(vContactList.size()>0){
          insert vContactList;  
        }
            
     }
}