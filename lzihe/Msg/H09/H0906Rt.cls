Class IHE.Msg.H09.H0906Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 接收者ID
Property ReceiverID As %String;

/// 发送者ID
Property SenderID As %String;

/// 申请单编号
Property AppInfoID As %String;

/// 住院号
Property HospitalizationId As %String;

/// 门（急）诊号
Property OutpatientId As %String;

/// 申请单开立者ID(医务人员ID)
Property AuthorID As %String;

/// 申请单有效期间（低值）
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 申请单有效期间（高值）
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 身份证号
Property IDCardNo As %String;

/// 医保卡号
Property MedicalInsuranceCard As %String;

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

}
