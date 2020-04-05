public class RV_EquipmentInventory_Update implements Schedulable {

   public class RvEquipment {
          String id;
          Boolean replacement;
          Integer quantity;
          String name;
          Integer maintenanceperiod;
          Integer lifespan;
          Integer cost;
          String sku;
       
       }
   public void execute(SchedulableContext ctx) {
       
       HttpRequest vReq = new HttpRequest();
       vReq.SetEndPoint('https://th-superbadge-apex.herokuapp.com/equipment');
       vReq.SetMethod('GET');
       Http vHttp = new Http();
       HttpResponse vRes = vHttp.send(vReq);
       String vResponse = vRes.getBody();
       vResponse = vResponse.replaceAll('_id', 'id');
       List<RvEquipment>  vEquipmentList = (List<RvEquipment>) JSON.deserialize(vResponse, List<RvEquipment>.class);       
       if(! vEquipmentList.isEmpty()) { 
           List<Product2> vProuctList = new List<Product2>();
           for(RvEquipment rvequip : vEquipmentList) {
                    Product2 vProduct = new Product2();
                    vProduct.Name = rvequip.name ;
                    vProduct.Cost__c = rvequip.cost;
                    vProduct.Current_Inventory__c =rvequip.quantity;
                    vProduct.Maintenance_Cycle__c = rvequip.maintenanceperiod;
                    vProduct.Replacement_Part__c = rvequip.replacement;
                    vProduct.Lifespan_Months__c = rvequip.lifespan;
                    vProduct.Warehouse_SKU__c = rvequip.sku;
                    vProduct.ProductCode = rvequip.id;
                    vProuctList.add(vProduct);
           }
           
       if(!vProuctList.isEmpty()) {
           upsert vProuctList;
         }
     }
       
  }  
     
}