Class IHE.Msg.H07.H0711Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 住院号
Property HospitalizationId As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 转入日期时间
Property TransInTime As %String(MAXLEN = 14);

/// 转入科室标识
Property TransInDeptCode As %String;

/// 转入科室名称
Property TransInDeptName As %String;

/// 转入病区标识
Property TransInAreaCode As %String(MAXLEN = 50);

/// 转入病区描述
Property TransInAreaName As %String;

/// 转入病房标识
Property TransInRoomCode As %String(MAXLEN = 50);

/// 转入病房描述
Property TransInRoomName As %String;

/// 转入病床标识
Property TransInBedCode As %String(MAXLEN = 50);

/// 转入病床描述
Property TransInBedName As %String;

/// 转出日期时间
Property TransOutTime As %String(MAXLEN = 14);

/// 转出科室标识
Property TransOutDeptCode As %String;

/// 转出科室名称
Property TransOutDeptName As %String;

/// 转出病区标识
Property TransOutAreaCode As %String(MAXLEN = 50);

/// 转出病区描述
Property TransOutAreaName As %String;

/// 转出病房标识
Property TransOutRoomCode As %String(MAXLEN = 50);

/// 转出病房描述
Property TransOutRoomName As %String;

/// 转出病床标识
Property TransOutBedCode As %String(MAXLEN = 50);

/// 转出病床描述
Property TransOutBedName As %String;

}
