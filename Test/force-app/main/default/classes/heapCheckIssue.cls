@isTest
private class heapCheckIssue{
    static testMethod void myTest(){
        String tStr = 'aaaaa bbbbb ccccc ddddd eeeeee fffff ggggg 11111 22222 33333 44444';
        List<String> baseList = tStr.split(' ');
        List<String> bigList = baseList;
        Map<integer, List<String>> SampleMap = new Map<integer, List<String>>();
        SampleMap.put(1, bigList);
        
        for (integer i=0; i<50; i++) {
            List<String> tempList = new List<String>();
            tempList = SampleMap.get(1);
            bigList.addAll(tempList);
        }
        system.debug('FINAL LIST SIZE IS '+bigList.size());
    }
}