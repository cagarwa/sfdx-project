trigger vUndeleteTest on Account (after undelete) {
    System.debug(Trigger.new[0].isDeleted);
    System.debug(Trigger.old);
}