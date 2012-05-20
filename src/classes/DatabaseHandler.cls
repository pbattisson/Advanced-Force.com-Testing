public with sharing class DatabaseHandler implements IDataHandler
{
	public void updateObjects(List<IDataObject> objects)
	{
		List<Sobject> updateList = new List<Sobject>();
		
		for(IDataObject obj : objects)
		{
			updateList.add(obj.getRecord());
		}
		
		update updateList;
	}
}