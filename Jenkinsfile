#!groovy
import groovy.json.JsonSlurperClassic
node {
   

    def BRANCH_NAME = env.BRANCH_NAME
    def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME

    /*def HUB_ORG=env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY= env.CONNECTED_APP_CONSUMER_KEY_DH*/

    
    println 'KEY IS' 
    println BRANCH_NAME
    println RUN_ARTIFACT_DIR
    def toolbelt = tool 'toolbelt'

    toolbelt = toolbelt+'\\SFDX'
    
    stage('checkout source') {
        // when running in multi-branch job, one must issue this command
        checkout scm
    }
    def props = readProperties  file: 'pipeline.properties'
    def HUB_ORG= props['HUB_ORG_DH']
    def SFDC_HOST= props['SFDC_HOST_DH']
    def JWT_KEY_CRED_ID = props['JWT_CRED_ID_DH']
    def CONNECTED_APP_CONSUMER_KEY= props['CONNECTED_APP_CONSUMER_KEY_DH']

    echo "HUB_ORG=${HUB_ORG_DH}"
    echo "SFDC_HOST=${SFDC_HOST_DH}"
    echo "JWT_KEY_CRED_ID=${JWT_CRED_ID_DH}"
    echo "CONNECTED_APP_CONSUMER_KEY=${CONNECTED_APP_CONSUMER_KEY_DH}"

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {
        stage('Connect to Sandbox') {
            if (isUnix()) {
                rc = sh returnStatus: true, script: "${toolbelt} force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            }else{
                 rc = bat returnStatus: true, script: "\"${toolbelt}\" force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile \"${jwt_key_file}\" --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            }
            if (rc != 0) { error 'hub org authorization failed' }

			println rc

            
          }
          stage('Convert to Metatdata') {
             rmsg = bat returnStdout: true, script: "\"${toolbelt}\" force:source:convert -r force-app -d mdapioutput"
             println(rmsg)
          }
          stage('Deploy to Sandbox') {
            rc = bat returnStatus: true, script: "\"${toolbelt}\"  force:mdapi:deploy -d mdapioutput -u ${HUB_ORG} -w 100" //-l RunLocalTests -c  -w 100" 
            println(rc)
            rc1 = bat returnStatus: true, script: "\"${toolbelt}\"  force:data:tree:import -f ServiceCredentials__c.json -u ${HUB_ORG} -w 100"
            println(rc1)
            cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, deleteDirs: true)
            if (rc != 0) { error 'Deployment failed' }
          }  
             

          
             
    } 
           
   
      
}