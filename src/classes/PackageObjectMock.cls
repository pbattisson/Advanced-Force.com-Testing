public with sharing class PackageObjectMock implements IDataObject
{
	private Package__c packageRecord;
	
	private Id packId;
	
	public PackageObjectMock(Package__c pack)
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
		return packId;
	}
	
	public void setRecordId(Id mockId)
	{
		packId = mockId;
	}
	
	public void save()
	{
		if(getRecordId() == null)
		{
			packId = '01IE0000000UAqt';	
		}
	}
}