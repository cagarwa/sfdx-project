global class TestChatterBlockerPolicyCondition implements TxnSecurity.PolicyCondition {

    public boolean evaluate(TxnSecurity.Event e) {
        return true;
    }

}