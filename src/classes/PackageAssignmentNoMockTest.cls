@isTest
private class PackageAssignmentNoMockTest {

	@isTest
    private static void TestAssignSinglePackage()
    {
    	//Create a package and give it a size
    	Package__c pack = new Package__c();
    	pack.Size__c = 9;
        
        //Create a truck with a capacity
       	Truck__c truck = new Truck__c();
       	truck.Capacity__c = 10;
       	//Note how we have to add extra data now
       	truck.Registration__c = 'OUTATIME';
       	
       	//Insert the test data
       	insert new List<Sobject>{truck, pack};

        //Create an instance of the class we are testing
        PackageAssignmentNoMock assigner = new PackageAssignmentNoMock();
        
        //Call the method we are testing and assign it's return value
        Boolean assignedTo90Percent = assigner.assignPackagesTo90PercentCapacity(truck, new List<Package__c>{pack});
        
        //Make our assertions
        System.assert(assignedTo90Percent, 'Packages should be assigned to 90% of truck capacity.');
        
        System.debug('Test Single Script Statements: ' + Limits.getScriptStatements());
        System.debug('Test Single CPU Time: ' + Limits.getCPUTime());
    }
    
    @isTest
    private static void TestAssignTwentyPackages()
    {
    	List<Package__c> packages = new List<Package__c>();
    	List<Sobject> testObjects = new List<Sobject>();
    	//Create a series of mock packages and give them sizes
    	for(integer i = 1; i <=20; i++)
    	{
        	Package__c pack = new Package__c();
    		pack.Size__c = i;
        	packages.add(pack);
        	testObjects.add(pack);
    	}
        
        //Create a truck with a capacity
       	Truck__c truck = new Truck__c();
       	truck.Capacity__c = 215; 
       	truck.Registration__c = 'OUTATIME';
        testObjects.add(truck);
        
        
        //Insert our test data
       	insert testObjects;
        
        //Create an instance of the class we are testing
        PackageAssignmentNoMock assigner = new PackageAssignmentNoMock();
        
        //Call the method we are testing and assign it's return value
        Boolean assignedTo90Percent = assigner.assignPackagesTo90PercentCapacity(truck, packages);
        
        //Make our assertions
        System.assert(assignedTo90Percent, 'Packages should be assigned to 90% of truck capacity.');
        
        System.debug('Test Twenty Script Statements: ' + Limits.getScriptStatements());
        System.debug('Test Twenty CPU Time: ' + Limits.getCPUTime());
    }
}