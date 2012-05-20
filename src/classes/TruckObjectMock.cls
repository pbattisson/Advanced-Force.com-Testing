public with sharing class TruckObjectMock implements IDataObject
{
	
	private Truck__c truckRecord;
	
	private Id truckId;
	
	public TruckObjectMock(Truck__c truck)
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
		return truckId;
	}
	
	public void setRecordId(Id mockId)
	{
		truckId = mockId;
	}
	
	public void save()
	{
		if(getRecordId() == null)
		{
			truckId = '01IE0000000UAqy';	
		}
	}
}