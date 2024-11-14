public with sharing class contactHandler {
   // public contactHandler() {

   public static void checkDummyJsonId(List<Contact> contacts){
    for (Contact c : contacts) {
       if (c.DummyJSON_Id__c == null) {
        c.DummyJSON_Id__c = string.valueOf(Math.random().intValue());
        } else {
            if (c.DummyJSON_Id__c != null && Integer.valueOf(c.DummyJSON_Id__c) <= 100) {
                // Call the future method to get dummy user details
                DummyJSONCallout.getDummyJSONUserFromIdFuture(c.DummyJSON_Id__c);
            } 
        }
   }
 }

   public static void handleAfterUpdate(List<Contact> updatedContacts) {
    for (Contact cont : updatedContacts) {
        if (cont.DummyJSON_Id__c != null && Integer.valueOf(cont.DummyJSON_Id__c) > 100) {
            DummyJSONCallout.postCreateDummyJSONUserAsync(cont.Id);
        }
    }
}

}

               
    
        
    
    
   




     
    

 
    

