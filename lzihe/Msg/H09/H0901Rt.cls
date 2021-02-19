Class IHE.Msg.H09.H0901Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 电子申请单ID
Property ExamAppInfoID As %String;

/// 申请单描述内容
Property ExamAppInfoContent As %String(MAXLEN = 1000);

/// 申请单状态
Property ExamAppInfoStatus As %String(MAXLEN = 50);

/// 申请单有效日期上限
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 申请单有效日期下限
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 优先级别代码
Property PriorityCode As %String(MAXLEN = 50);

/// 优先级别名称
Property PriorityName As %String(MAXLEN = 50);

/// 标本ID
Property SpecimenID As %String;

/// 标本类别代码
Property SpecimenTypeCode As %String;

/// 标本类别名称
Property SpecimenTypeName As %String;

/// 开单日期时间
Property AuthorTime As %String(MAXLEN = 14);

/// 开立者签名
Property AuthorSignatureText As %String(MAXLEN = 50);

/// 开立者ID
Property AuthorID As %String(MAXLEN = 50);

/// 开立者姓名
Property AuthorName As %String;

/// 开立科室代码
Property AuthorDeptCode As %String;

/// 开立科室名称
Property AuthorDeptName As %String;

/// 审核日期时间
Property AuditTime As %String(MAXLEN = 14);

/// 审核者工号
Property AuditUserWorkNo As %String(MAXLEN = 50);

/// 审核者姓名
Property AuditUserName As %String;

/// 检验项目节点
Property Component2 As list Of IHE.Msg.H09.ExamItem;

/// 注意事项
Property Notices As %String;

/// 门急诊号
Property OutpatientId As %String;

/// 住院号
Property HospitalizationId As %String;

/// 就诊类别代码
Property AdmTypeCode As %String;

/// 就诊类别名称
Property AdmTypeName As %String;

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者医保卡号
Property MedicalInsuranceCard As %String(MAXLEN = 50);

/// 患者姓名
Property PatientName As %String;

/// 患者电话
Property PatientTelecom As %String;

/// 性别代码
Property PatientGenderCode As %String;

/// 性别名称
Property GenderName As %String;

/// 出生日期
Property PatientBirthTime As %String;

/// 年龄
Property PatientAge As %String;

/// 地址
Property PatientAddr As %String(MAXLEN = 70);

/// 病床编码
Property BedCode As %String(MAXLEN = 50);

/// 病床号
Property BedNumber As %String;

/// 病房编号
Property RoomCode As %String(MAXLEN = 50);

/// 病房号
Property RoomNumber As %String;

/// 科室代码
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 病区代码
Property InpatientAreaId As %String(MAXLEN = 50);

/// 病区名称
Property InpatientAreaName As %String;

/// 诊断节点
Property PertinentInformation1 As %String;

/// 诊断类别编码
Property DiagnosisTypeCode As %String(MAXLEN = 50);

/// 诊断类别名称
Property DiagnosisTypeName As %String(MAXLEN = 50);

/// 诊断时间
Property DiagnosisTime As %String;

/// 疾病编码
Property DiseaseCode As %String;

/// 疾病名称
Property DiseaseName As %String;

}
