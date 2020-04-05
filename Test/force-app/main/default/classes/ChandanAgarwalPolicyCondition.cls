global class ChandanAgarwalPolicyCondition implements TxnSecurity.PolicyCondition {

    public boolean evaluate(TxnSecurity.Event e) {
       System.assertEquals(true,false,e);
        return false;
    }

}