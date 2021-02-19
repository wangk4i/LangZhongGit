Class IHE.Msg.H09.ExamItem Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 医嘱ID
Property OrderID As %String(MAXLEN = 50);

/// 检验项目编码
Property ExamItemCode As %String;

/// 检验项目名称
Property ExamItemName As %String;

/// 检验方法代码
Property ExamFunctionCode As %String;

/// 检验方法名称
Property ExamFunctionName As %String;

/// 执行日期时间
Property ServiceTime As %String;

/// 执行科室代码
Property ServiceDeptCode As %String;

/// 执行科室名称
Property ServiceDeptName As %String;

}
