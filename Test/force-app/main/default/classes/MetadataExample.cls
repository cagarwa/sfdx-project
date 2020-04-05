public class MetadataExample {
    public static void updateMetadata(){
        Metadata.CustomMetadata customMetadata  = new Metadata.CustomMetadata();
        customMetadata.fullname  ='MyNamespace__MyMetadataTypeName.MyMetadataRecordName';
        Metadata.CustomMetadataValue customField = new Metadata.CustomMetadataValue();
        customField.field = 'customField__c';
        customField.value ='New value';
        customMetadata.values.add(customField);

        Metadata.DeployContainer deployContainer  = new Metadata.DeployContainer();
        deployContainer.addMetadata(customMetadata);
        Id asyncResultId = Metadata.Operations.enqueueDeployment(deployContainer,null);
        System.debug(asyncResultId);
        
    }
}