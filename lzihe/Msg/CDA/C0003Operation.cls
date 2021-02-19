Class IHE.Msg.CDA.C0003Operation Extends (IHE.Msg.CDA.Common.Address, %RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 手术及操作代码
Property OperationCode As %String;

/// 手术名称
Property OperationDesc As %String;

/// 手术及操作部位名称
Property OperationPartName As %String;

/// 介入物名称
Property InterventionName As %String;

/// 操作方法描述
Property OperationWayDesc As %String;

/// 操作次数
Property OperationTimes As %String;

}
