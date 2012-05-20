public with sharing class PackageObject implements IDataObject
{
	private Package__c packageRecord;
	
	public PackageObject(Package__c pack)
	{
		if(pack == null)
		{
			packageRecord = new Package__c();
		}
		else
		{
			packageRecord = pack;
		}
	}
	
	public SObject getRecord()
	{
		return packageRecord;
	}
	
	public void setRecord(SObject record)
	{
		packageRecord = (Package__c)record;
	}
	
	public Id getRecordId()
	{
		return packageRecord.Id;
	}
	
	public void save()
	{
		if(getRecordId() == null)
		{
			insert packageRecord;
		}
		else
		{
			update packageRecord;
		}
	}
}