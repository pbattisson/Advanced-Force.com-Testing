public with sharing class DatabaseHandlerMock implements IDataHandler
{
	public void updateObjects(List<IDataObject> objects)
	{
		//Register the call of this method.
		MockAssertionManager.addMethodCalledWithParameter('updateObjects', 'objects', objects);
	}
}