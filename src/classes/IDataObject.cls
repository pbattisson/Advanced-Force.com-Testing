public interface IDataObject 
{
	SObject getRecord();
	void setRecord(SObject record);
	Id getRecordId();
	void save();
}