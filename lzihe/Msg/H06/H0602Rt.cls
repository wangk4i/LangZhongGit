Class IHE.Msg.H06.H0602Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询ID
Property QueryId As %String(MAXLEN = 50);

/// 文档注册日期时间上限
Property ExecutionAndDeliveryTimeLow As %String(MAXLEN = 14);

/// 文档注册日期时间下限
Property ExecutionAndDeliveryTimeHigh As %String(MAXLEN = 14);

/// 文档创建者工号
Property AssignedAuthorWorkNo As %String(MAXLEN = 50);

/// 文档创建者姓名
Property AssignedAuthorName As %String;

/// 文档类型代码
Property DocumentTypeCode As %String(MAXLEN = 50);

/// 文档类型描述
Property DocumentTypeCodeName As %String(MAXLEN = 100);

/// 文档生成日期时间上限
Property DEffectiveTimeLow As %String(MAXLEN = 14);

/// 文档生成日期时间下限
Property DEffectiveTimeHigh As %String(MAXLEN = 14);

/// 患者就诊日期时间上限
Property PEffectiveTimeLow As %String;

/// 患者就诊日期时间下限
Property PEffectiveTimeHigh As %String;

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
