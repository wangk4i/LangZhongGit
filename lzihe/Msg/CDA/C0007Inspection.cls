Class IHE.Msg.CDA.C0007Inspection Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 检验项目代码
Property InspectionCode As %String;

/// 检验日期
Property InspectionTime As %String;

/// 标本采样日期时间
Property SamplingTime As %String;

/// 接收标本日期时间
Property ReceiveTime As %String;

/// 标本类别
Property SpecimenType As %String;

/// 标本状态
Property SpecimenStatus As %String;

/// 检验结果代码
Property ResultCode As %String;

/// 检验结果名称
Property ResultName As %String;

/// 检验定量结果计量单位
Property ResultUnit As %String;

}
