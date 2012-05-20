/**
  * @author Paul Battisson (@pbattisson)
  * @description This class helps you to make assertions in tests using a mock object. In your mock object you 
  *					should call the addMethodCalled() method calling the correct overloaded method you require.
  *					In your test you can then call one of the retrieval methods.  
  */
public with sharing class MockAssertionManager 
{
	/**
	  * @description This map holds a series or method names and then a map containing the 
	  *					parameters passed in to the method and there values. 
	  */
	private static Map<String, Map<String, object>> methodCalls = new Map<String, Map<String, object>>();
	
	/**
	  * @description This method is for registering that a method (typically with a void return)
	  * 				from your mock class has been called.
	  * @param methodName The name of the method in the mock class that has been called.
	  */
	public static void addMethodCalled(String methodName)
	{
		methodCalls.put(methodName, null);
	}
	
	/**
	  * @description This method is for registering a method call with a given parameter name
	  *					with a given parameter value.
	  * @param methodName The name of the method called.
	  * @param paramName The name of the parameter being passed in.
	  * @param paramValue The value of the paramter that was passed in.
	  */
	public static void addMethodCalledWithParameter(String methodName, String paramName, object paramValue)
	{
		Map<String, object> parameterMap = new Map<String, object>();
		parameterMap.put(paramName, paramValue);
		methodCalls.put(methodName, parameterMap);
	}
	
	/**
	  * @description This method is for registering a method call with a series of parameters and values
	  *					stored in a map.
	  * @param methodName The name of the method called.
	  * @parameterMap The map of parameter names to values.
	  */
	public static void addMethodCalledWithParameters(String methodName, Map<String, object> parameterMap)
	{
		methodCalls.put(methodName, parameterMap);
	}
	
	/**
	  * @description This method is to be called when you want to return a boolean indictaing whether or not
	  *					the particular method has been called.
	  * @param methodName The name of the method we are asserting has been called.
	  * @return A boolean value indicating whether or not the method was called.
	  */
	public static boolean wasMethodCalled(String methodName)
	{
		// Return whether or not we know the method was called.
		return methodCalls.containsKey(methodName);
	}
	
	/**
	  * @description This method is used to check that a method was called with a paramter and that its value
	  *					is correct.
	  * @param methodName The name of the method.
	  * @param paramName The name of the parameter.
	  * @param paramValue The value of the parameter we are expecting.
	  * @return A boolean indicating whether or not the value of the parameter was as expected.
	  */
	public static boolean wasMethodCalledWithParameter(String methodName, String paramName, object paramValue)
	{
		// First check the method was actually called.
		if(!methodCalls.containsKey(methodName))
		{
			return false;
		}
		// Return whether or not the values match. 
		return methodCalls.get(methodName).get(paramName) == paramValue;
	}
	
	/**
	  * @description This method is used to verify that a method was called with a particaulr set of parameter values.
	  * @param methodName The name of the method called.
	  * @parameterMap The map of parameter names to values that we are checking.
	  * @return A boolean indicating whether all the value were correct. 
	  */
	public static boolean wasMethodCalledWithParameters(String methodName, Map<String, object> parameterMap)
	{
		// First check the method was actually called.
		if(!methodCalls.containsKey(methodName))
		{
			return false;
		}
		
		// We assume that the parameters were correctly passed in 
		Boolean correctParams = true;
		
		// Then we loop through all the parameters we are asserting
		for(String paramName : parameterMap.keySet())
		{
			// And decide whether or not it is correct and then return a boolean decision on that 
			// and our pre-exsting calculations. Once one parameter has been found wrong then it 
			// will make correctParams false and so will it remain.
			correctParams =  (methodCalls.get(methodName).get(paramName) == parameterMap.get(paramName)) && correctParams; 
		}
		
		return correctParams;
	}
}