Class IHE.Msg.H09.OperationInfoItem Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 手术编码
Property OperationCode As %String;

/// 手术名称
Property OperationName As %String(MAXLEN = 50);

/// 手术等级编码
Property OperationLevelCode As %String;

/// 手术等级名称
Property OperationLevelTime As %String;

/// 预定手术时间
Property ReserveOperationTime As %String(MAXLEN = 50);

/// 手术医师工号
Property OperationDrID As %String(MAXLEN = 50);

/// 手术医师名称
Property OperationDrName As %String;

/// 执行科室编码
Property ServiceDeptCode As %String;

/// 执行科室名称
Property ServiceDeptName As %String;

}
