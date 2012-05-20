public with sharing class PackageAssignmentNoMock
{
	//We are going to have a system where we can passin a list of available packages and a truck then assign as many packages as possible to that truck for use 
	public boolean assignPackagesTo90PercentCapacity(Truck__c truck, List<Package__c> packages)
	{
		//Set up our variables to stored the information we will require
		integer remainingCapacity = Integer.valueOf(truck.Capacity__c);
		List<Package__c> updatePackages = new List<Package__c>();
		
		//Loop through our packages
		for(Package__c pack : packages)
		{
			//Check that the truck has space and that it is looking at a package in the correct depot
			if(remainingCapacity >= pack.Size__c)
			{
				//If so add it to the truck, set it to be updated and reduce the available truck capacity.
				pack.Truck__c = truck.Id;
				remainingCapacity -= Integer.valueOf(pack.Size__c);
				updatePackages.add(pack);
			}
		}
		
		//Update the packages
		update updatePackages;
		
		//return a boolean letting me know whether or not I have filled the truck to 90%
		return remainingCapacity/truck.Capacity__c <= 0.1;
	}
}