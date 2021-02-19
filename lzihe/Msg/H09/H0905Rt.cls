Class IHE.Msg.H09.H0905Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 接收者ID
Property ReceiverID As %String(MAXLEN = 50);

/// 发送者ID
Property SenderID As %String(MAXLEN = 50);

/// 申请单编号
Property AppInfoID As %String;

/// 申请单有效日期上限
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 申请单有效日期下限
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 优先级别代码
Property PriorityCode As %String(MAXLEN = 50);

/// 优先级别名称
Property PriorityName As %String(MAXLEN = 50);

/// 开单日期时间
Property AuthorTime As %String;

/// 开单医师工号
Property AuthorID As %String(MAXLEN = 50);

/// 开单医师姓名
Property AuthorName As %String;

/// 申请科室编码
Property AuthorDeptCode As %String;

/// 申请科室名称
Property AuthorDeptName As %String;

/// 审核日期时间
Property AuditTime As %String;

/// 审核者工号
Property AuditUserWorkNo As %String(MAXLEN = 50);

/// 审核者姓名
Property AuditUserName As %String;

/// 检查项目根结点
Property Component2 As list Of IHE.Msg.H09.Item;

/// 注意事项
Property Notices As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别编码
Property AdmTypeCode As %String;

/// 就诊类别名称
Property AdmTypeName As %String;

/// 域ID
Property DomainId As %String(MAXLEN = 50);

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

/// 门（急）诊号标识
Property OutpatientId As %String;

/// 住院号标识
Property HospitalizationId As %String;

/// 患者身份证号
Property IDCardNo As %String;

/// 医保卡号
Property MedicalInsuranceCard As %String(MAXLEN = 50);

/// 患者姓名
Property PatientName As %String;

/// 患者电话
Property PatientTelecom As %String;

/// 性别代码
Property PatientGenderCode As %String;

/// 出生日期
Property BirthTime As %String;

/// 年龄
Property PatientAge As %String;

/// 地址
Property PatientAddr As %String(MAXLEN = 100);

/// 病床编码
Property BedCode As %String(MAXLEN = 50);

/// 病床号
Property BedNumber As %String;

/// 病房编号
Property RoomCode As %String(MAXLEN = 50);

/// 病房号
Property RoomNumber As %String;

/// 科室编码
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 病区编码
Property InpatientAreaId As %String(MAXLEN = 50);

/// 病区名称
Property InpatientAreaName As %String;

/// 诊断根节点
Property PertinentInformation1 As %String;

/// 诊断类别编码
Property DiagnosisTypeCode As %String(MAXLEN = 50);

/// 诊断类别名称
Property DiagnosisTypeName As %String(MAXLEN = 50);

/// 疾病编码
Property DiseaseCode As %String;

/// 疾病名称
Property DiseaseName As %String;

}
