Class IHE.Msg.H06.H0603Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询ID
Property QueryId As %String(MAXLEN = 50);

/// 文档类型代码
Property DocumentTypeCode As %String(MAXLEN = 50);

/// 文档类型描述
Property DocumentTypeCodeName As %String(MAXLEN = 100);

/// 文档流水号
Property DocumentId As %String;

/// 住院号
Property HospitalizationId As %String;

/// 门诊号
Property OutpatientId As %String;

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

}
