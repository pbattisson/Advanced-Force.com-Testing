public with sharing class TruckObject implements IDataObject
{
	private Truck__c truckRecord;
	
	public TruckObject(Truck__c truck)
	{
		if(truck == null)
		{
			truckRecord = new Truck__c();
		}
		else
		{
			truckRecord = truck;
		}
	}
	
	public SObject getRecord()
	{
		return truckRecord;
	}
	
	public void setRecord(SObject record)
	{
		truckRecord = (Truck__c)record;
	}
	
	public Id getRecordId()
	{
		return truckRecord.Id;
	}
	
	public void save()
	{
		if(getRecordId() == null)
		{
			insert truckRecord;
		}
		else
		{
			update truckRecord;
		}
	}
}