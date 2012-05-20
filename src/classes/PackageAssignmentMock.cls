public with sharing class PackageAssignmentMock 
{
	//We are going to have a system where we can passin a list of available packages and a truck then assign as many packages as possible to that truck for use 
	public boolean assignPackagesTo90PercentCapacity(IDataObject truck, List<IDataObject> packages, IDataHandler handler)
	{
		//Set up our variables to stored the information we will require
		integer remainingCapacity = Integer.valueOf(truck.getRecord().get('Capacity__c'));
		List<IDataObject> updatePackages = new List<IDataObject>();
		
		//Loop through our packages
		for(IDataObject pack : packages)
		{
			//Check that the truck has space 
			if(remainingCapacity >= (Decimal)pack.getRecord().get('Size__c'))
			{
				//If so add it to the truck, set it to be updated and reduce the available truck capacity.
				pack.getRecord().put('Truck__c', truck.getRecordId());
				remainingCapacity -= Integer.valueOf(pack.getRecord().get('Size__c'));
				updatePackages.add(pack);
			}
		}
		
		//Update the packages
		handler.updateObjects(updatePackages);
		
		//return a boolean letting me know whether or not I have filled the truck to 90%
		return remainingCapacity/(Decimal)truck.getRecord().get('Capacity__c') <= 0.1;
	}

}