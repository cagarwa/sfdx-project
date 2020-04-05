@isTest
private class TestVerifyDate {
   @isTest static void testVerifyDatecheck() {
       
       Date vDate = date.today();
       
       Date vCheckDate = VerifyDate.CheckDates(vDate,vDate+30);
       Date vCheckDate1 = VerifyDate.CheckDates(vDate,vDate+20);
       
    }
}