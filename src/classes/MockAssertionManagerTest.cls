/**
  * @author Paul Battisson (@pbattisson)
  * @descrition The test class for MockAssertionManager. 
  */

@isTest
private with sharing class MockAssertionManagerTest 
{
	@isTest
	private static void testAddAndRetrieveMethodNoParameters()
	{
		MockAssertionManager.addMethodCalled('myTestMethod');
		System.assert(MockAssertionManager.wasMethodCalled('myTestMethod'), 'Should register method call and return true.');
	}
	
	@isTest
	private static void testAttemptToRetrieveUncalledMethodNoParameters()
	{
		System.assert(!MockAssertionManager.wasMethodCalled('myTestMethod'), 'Should return false as method call was not registered.');
	}
	
	@isTest 
	private static void testAddAndRetrieveMethodSingleStringParam()
	{
		MockAssertionManager.addMethodCalledWithParameter('myTestMethod', 'testParamName', 'testParamValue');
		
		System.assert(MockAssertionManager.wasMethodCalledWithParameter('myTestMethod', 'testParamName', 'testParamValue'), 'Should return true and register method call with parameter and value');
	}
	
	@isTest 
	private static void testAddAndRetrieveMethodSingleIntegerParam()
	{
		MockAssertionManager.addMethodCalledWithParameter('myTestMethod', 'testParamName', 12);
		
		System.assert(MockAssertionManager.wasMethodCalledWithParameter('myTestMethod', 'testParamName', 12), 'Should return true and register method call with parameter and value');
	}
	
	@isTest
	private static void testAttemptToRetrieveUncalledMethodWithSingleParam()
	{
		System.assert(!MockAssertionManager.wasMethodCalledWithParameter('myTestMethod', 'testParamName', 'testParamValue'), 'Should return false as method call was not registered.');
	}
	
	@isTest 
	private static void testAttemptToRetrieveCalledMethodWithSingleIncorrectParam()
	{
		MockAssertionManager.addMethodCalledWithParameter('myTestMethod', 'testParamName', 12);
		
		System.assert(!MockAssertionManager.wasMethodCalledWithParameter('myTestMethod', 'testParamName', 11), 'Should return false as parameter is incorrect.');
	}
	
	@isTest
	private static void testAttemptToRetrieveCalledMethodWithSingleIncorrectParamName()
	{
		MockAssertionManager.addMethodCalledWithParameter('myTestMethod', 'testParamName', 12);
		
		System.assert(!MockAssertionManager.wasMethodCalledWithParameter('myTestMethod', 'testParamName1', 12), 'Should return false as parameter name is incorrect.');
	}
	
	@isTest
	private static void testAttemptAddAndRetrieveMethodMultipleParameters()
	{
		Map<String, object> parameterMap = new Map<String, object>();
		parameterMap.put('param1', 123);
		parameterMap.put('param2', 'SomeString');
		
		MockAssertionManager.addMethodCalledWithParameters('myTestMethod', parameterMap);
		
		System.assert(MockAssertionManager.wasMethodCalledWithParameters('myTestMethod', parameterMap), 'Should return true for and register method and values');
	}
	
	
	@isTest
	private static void testAttemptAddAndRetrieveMethodMultipleIncorrectParameters()
	{
		Map<String, object> parameterMap = new Map<String, object>();
		parameterMap.put('param1', 123);
		parameterMap.put('param2', 'SomeString');
		
		MockAssertionManager.addMethodCalledWithParameters('myTestMethod', parameterMap);
		
		// Note: I am creating a second paramter map because of the way in which we pass values by reference means that updating the first map updates the stored values elsewhere it seems.
		Map<String, object> parameterMap2 = new Map<String, object>();
		parameterMap2.put('param1', 12);
		parameterMap2.put('param2', 'SomeString1');
		
		System.assert(!MockAssertionManager.wasMethodCalledWithParameters('myTestMethod', parameterMap2), 'Should return false as has incorrect values');
	}
	
	@isTest
	private static void testAttemptAddAndRetrieveMethodMultipleParametersOneIncorrect()
	{
		Map<String, object> parameterMap = new Map<String, object>();
		parameterMap.put('param1', 123);
		parameterMap.put('param2', 'SomeString');
		
		MockAssertionManager.addMethodCalledWithParameters('myTestMethod', parameterMap);
		
		// Note: I am creating a second paramter map because of the way in which we pass values by reference means that updating the first map updates the stored values elsewhere it seems.
		Map<String, object> parameterMap2 = new Map<String, object>();
		parameterMap2.put('param1', 123);
		parameterMap2.put('param2', 'SomeString1');
		
		System.assert(!MockAssertionManager.wasMethodCalledWithParameters('myTestMethod', parameterMap2), 'Should return false as has incorrect values');
	}
	
	@isTest
	private static void testAttemptRetrieveMultipleParametersNoMethodCalled()
	{
		Map<String, object> parameterMap = new Map<String, object>();
		parameterMap.put('param1', 123);
		parameterMap.put('param2', 'SomeString');
		
		MockAssertionManager.addMethodCalledWithParameters('myTestMethod', parameterMap);
		
		System.assert(!MockAssertionManager.wasMethodCalledWithParameters('myTestMethod1', parameterMap), 'Should return false as has incorrect method name');
	}
}