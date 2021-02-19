Class IHE.Msg.H09.H0912Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 申请单号
Property AppInfoID As %String;

/// 住院号
Property HospitalizationId As %String;

/// 门诊号标识
Property OutpatientId As %String;

/// 开单医生工号
Property AuthorID As %String(MAXLEN = 50);

/// 开单日期时间上限
Property AuthorTimeLow As %String(MAXLEN = 14);

/// 开单日期时间下限
Property AuthorTimeHigh As %String(MAXLEN = 14);

/// 身份证号
Property IDCardNo As %String;

/// PatientID
Property PatientID As %String(MAXLEN = 50);

}
