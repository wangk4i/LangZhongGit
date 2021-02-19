Class IHE.Msg.H09.Item Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 医嘱ID
Property OrderID As %String(MAXLEN = 50);

/// 检查类项目编码
Property ItemCode As %String;

/// 检查项目名称
Property ItemName As %String;

/// 检查方式编码
Property ItemFunctionCode As %String(MAXLEN = 50);

/// 检查方式名称
Property ItemFunctionName As %String(MAXLEN = 50);

/// 检查类型编码
Property ItemTypeCode As %String(MAXLEN = 50);

/// 检查类型名称
Property ItemTypeName As %String(MAXLEN = 50);

/// 检查部位编码
Property ItemPartCode As %String(MAXLEN = 50);

/// 检查部位名称
Property ItemPartName As %String(MAXLEN = 50);

/// 执行时间
Property ServiceTime As %String(MAXLEN = 14);

/// 执行科室编码
Property ServiceDeptCode As %String;

/// 执行科室名称
Property ServiceDeptName As %String;

}
