Class IHE.Msg.H09.H0912Rp Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 处理结果，固定值AA表示成功
Property ResultCode As %String;

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

/// 申请单号
Property AppInfoID As %String;

/// 申请单详细信息
Property AppInfoDetail As %String(MAXLEN = 1000);

/// 申请日期时间
Property AppTime As %String(MAXLEN = 14);

/// 优先（紧急）度代码
Property PriorityCode As %String(MAXLEN = 50);

/// 优先（紧急）度描述
Property PriorityName As %String(MAXLEN = 100);

/// 开单时间
Property AuthorTime As %String(MAXLEN = 14);

/// 开单医生工号
Property AuthorID As %String(MAXLEN = 50);

/// 开单医生姓名
Property AuthorName As %String;

/// 申请科室编码
Property AuthorDeptCode As %String;

/// 申请科室名称
Property AuthorDeptName As %String;

/// 审核日期时间
Property AuditTime As %String(MAXLEN = 14);

/// 审核者工号
Property AuditUserWorkNo As %String(MAXLEN = 50);

/// 审核者姓名
Property AuditUserName As %String;

/// 患者ABO血型代码
Property PatientABOCode As %String;

/// 患者ABO血型描述
Property PatientABODescribe As %String;

/// 患者RH血型代码
Property PatientRHCode As %String;

/// 患者RH血型描述
Property PatientRHDescribe As %String;

/// 患者身高
Property PatientHeight As %String;

/// 患者体重
Property PatientWeight As %String;

/// 患者收缩压
Property PatientSystolicPressure As %String;

/// 患者舒张压
Property PatientDiastolicPressure As %String;

/// 患者体温
Property PatientTemperature As %String;

/// 患者脉搏
Property PatientPulse As %String;

/// 申请ABO血型代码
Property ApplyABOCode As %String;

/// 申请ABO血型描述
Property ApplyABODescribe As %String;

/// 申请RH血型代码
Property ApplyRHCode As %String;

/// 申请RH血型描述
Property ApplyRHDescribe As %String;

/// 采血标记
Property BloodCollectionMark As %String(MAXLEN = 10);

/// 输血地点
Property BloodTransfusionSite As %String(MAXLEN = 100);

/// 输血目的
Property BloodTransfusionPurpose As %String;

/// 输血性质
Property BloodTransfusionNature As %String(MAXLEN = 100);

/// 输血紧急标志
Property BloodTransfusionMark As %String(MAXLEN = 10);

/// 病史信息
Property MedicalHistoryInfo As %String;

/// 输血史
Property BloodTransfusionHistory As %String(MAXLEN = 1000);

/// 输血反应史
Property BloodTransfusionReactionHistory As %String(MAXLEN = 1000);

/// 药物过敏史
Property DrugAllergyHistory As %String(MAXLEN = 1000);

/// 孕次
Property PregnanciesNumber As %String;

/// 产次
Property BirthsNumber As %String;

/// 其他重要病史
Property OtherMedicalHistory As %String(MAXLEN = 1000);

/// 备注
Property Notices As %String(MAXLEN = 1000);

/// 血量单位
Property BloodVolumeUnit As %String(MAXLEN = 50);

/// 血量
Property BloodVolume As %String(MAXLEN = 6);

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

/// 门（急）诊号
Property OutpatientId As %String;

/// 住院号
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

/// 查询响应代码
Property ResponseCode As %String(MAXLEN = 50);

}
