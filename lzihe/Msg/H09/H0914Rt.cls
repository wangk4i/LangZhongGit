Class IHE.Msg.H09.H0914Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
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

/// 申请日期
Property AppTime As %String(MAXLEN = 14);

/// 麻醉方式编码
Property AnaesthesiaTypeCode As %String;

/// 麻醉方式名称
Property AnaesthesiaTypeName As %String;

/// 手术性质编码
Property OperationTypeCode As %String(MAXLEN = 50);

/// 手术性质名称
Property OperationTypeName As %String(MAXLEN = 50);

/// 申请医师工号
Property AuthorID As %String(MAXLEN = 50);

/// 申请医师姓名
Property AuthorName As %String;

/// 申请科室编码
Property AuthorDeptCode As %String;

/// 申请科室名称
Property AuthorDeptName As %String;

/// 审核日期
Property AuditTime As %String;

/// 审核医师工号
Property AuditUserWorkNo As %String(MAXLEN = 50);

/// 审核人姓名
Property AuditUserName As %String;

/// 手术内容根节点
Property Component2 As list Of IHE.Msg.H09.OperationInfoItem;

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

/// 就诊（住院）日期
Property SeenTime As %String;

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
Property GenderCode As %String;

/// 性别名称
Property GenderName As %String;

/// 出生日期
Property BirthTime As %String;

/// 年龄
Property PatientAge As %String;

/// 地址
Property PatientAddr As %String(MAXLEN = 50);

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
Property InpatientAreaId As %String;

/// 病区名称
Property InpatientAreaName As %String(MAXLEN = 50);

/// 诊断（手术申请原因）
Property Diagnosis As %String;

/// 诊断类别编码
Property DiagnosisTypeCode As %String(MAXLEN = 50);

/// 诊断类别名称
Property DiagnosisTypeName As %String(MAXLEN = 50);

/// 疾病编码
Property DiseaseCode As %String;

/// 疾病名称
Property DiseaseName As %String;

}
