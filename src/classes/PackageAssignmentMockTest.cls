@isTest
private class PackageAssignmentMockTest {
	
	@isTest
    private static void TestAssignSinglePackage()
    {
    	//Create a mock package and give it a size
        IDataObject mockPackage = new PackageObjectMock(null);
        mockPackage.getRecord().put('Size__c', 9);
        
        //Create a mock truck with a capacity and an Id (set by calling Save())
        IDataObject mockTruck = new TruckObjectMock(null);
        mockTruck.Save();
        mockTruck.getRecord().put('Capacity__c', 10); 
        
        //Create a mock handler 
        IDataHandler mockHandler = new DatabaseHandlerMock();
        
        //Create an instance of the class we are testing
        PackageAssignmentMock assigner = new PackageAssignmentMock();
        
        //Call the method we are testing and assign it's return value
        Boolean assignedTo90Percent = assigner.assignPackagesTo90PercentCapacity(mockTruck, new List<IDataObject>{mockPackage}, mockHandler);
        
        //Make our assertions
        System.assert(assignedTo90Percent, 'Packages should be assigned to 90% of truck capacity.');
        System.assert(MockAssertionManager.wasMethodCalled('updateObjects'), 'Save method should have been called on our list of packages.');
        
        System.debug('Test Single Script Statements: ' + Limits.getScriptStatements());
        System.debug('Test Single CPU Time: ' + Limits.getCPUTime());
    }
    
    @isTest
    private static void TestAssignTwentyPackages()
    {
    	List<IDataObject> packages = new List<IDataObject>();
    	//Create a series of mock packages and give them sizes
    	for(integer i = 1; i <=20; i++)
    	{
        	IDataObject mockPackage = new PackageObjectMock(null);
        	mockPackage.getRecord().put('Size__c', i);
        	packages.add(mockPackage);
    	}
        
        //Create a mock truck with a capacity and an Id (set by calling Save())
        IDataObject mockTruck = new TruckObjectMock(null);
        mockTruck.Save();
        mockTruck.getRecord().put('Capacity__c', 215); 
        
        //Create a mock handler 
        IDataHandler mockHandler = new DatabaseHandlerMock();
        
        //Create an instance of the class we are testing
        PackageAssignmentMock assigner = new PackageAssignmentMock();
        
        //Call the method we are testing and assign it's return value
        Boolean assignedTo90Percent = assigner.assignPackagesTo90PercentCapacity(mockTruck, packages, mockHandler);
        
        //Make our assertions
        System.assert(assignedTo90Percent, 'Packages should be assigned to 90% of truck capacity.');
        System.assert(MockAssertionManager.wasMethodCalledWithParameter('updateObjects', 'objects', packages), 'Save method should have been called on our list of packages.');
        
        System.debug('Test Twenty Script Statements: ' + Limits.getScriptStatements());
        System.debug('Test Twenty CPU Time: ' + Limits.getCPUTime());
    }
}