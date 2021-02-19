Class IHE.Msg.CDA.C0001 Extends (IHE.Msg.CDA.Common.DocHead, %RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 健康档案标识号
Property HealthRecordCode As %String;

/// 健康卡号
Property HealthCardCode As %String;

/// 患者地址
Property PatientAddr As IHE.Msg.CDA.Common.Address;

/// 患者联系电话
Property TelPhone As list Of %String;

/// 患者信息
Property PatientInfo As IHE.Msg.CDA.Common.Patient;

/// 患者婚姻状况代码
Property MarriageCode As %String;

/// 患者婚姻状况名称
Property MarriageValue As %String;

/// 民族代码
Property NationCode As %String;

/// 民族名称
Property NationValue As %String;

/// 工作单位
Property Occupation As list Of IHE.Msg.CDA.C0001Occupation;

/// 职业类别代码
Property EmployerTypeCode As %String;

/// 职业类别名称
Property EmployerTypeName As %String;

/// 建档医疗机构
Property ScopingOrgCode As %String;

/// 医疗机构名称
Property ScopingOrgName As %String;

/// 联系人
Property Contacts As list Of IHE.Msg.CDA.C0001Contacts;

/// 父文档标识符
Property ParentDocID As %String;

/// 文档集序列号
Property ParentDocSetID As %String;

/// 文档版本号
Property ParentVersion As %String;

/// ABO血型代码
Property PatientABOCode As %String;

/// ABO血型名称
Property PatientABODescribe As %String;

/// Rh血型代码
Property PatientRHCode As %String;

/// Rh血型名称
Property PatientRHDescribe As %String;

/// 疾病史（含外伤）描述
Property HoD As list Of %String;

/// 传染病史描述
Property HoID As list Of %String;

/// 手术史描述
Property HoO As list Of %String;

/// 婚育史描述
Property HoM As list Of %String;

/// 输血史描述
Property HoT As %String;

/// 过敏史描述
Property HoA As list Of %String;

/// 预防接种史描述
Property HoI As list Of %String;

/// 个人史描述
Property HoP As %String;

/// 月经史描述
Property HoPenses As %String;

/// 家族史描述
Property HoF As list Of %String;

/// 医疗机构科室名称
Property HospitalDeptName As %String;

/// 患者类型代码
Property PatientTypeCode As %String;

/// 门（急）诊号
Property OutPatientID As %String;

/// 住院号
Property HospitalizationID As %String;

/// 入院日期
Property EncounterTime As %String;

/// 出院日期
Property DischargeTime As %String;

/// 发病日期时间
Property IllnessTime As %String;

/// 就诊原因描述
Property AdmReason As %String;

/// 就诊日期时间
Property AdmTime As %String;

/// 西医诊断
Property WesternDiag As list Of IHE.Msg.CDA.C0001WesternDiag;

/// 其他西医诊断代码
Property OtherWesternDiagCode As %String;

/// 其他西医诊断名称
Property OtherWesternDiagName As %String;

/// 中医诊断
Property ChineseDiag As list Of IHE.Msg.CDA.C0001ChineseDiag;

/// 手术及操作代码
Property OperationCode As list Of %String;

/// 关键药物
Property KeyDrug As list Of IHE.Msg.CDA.C0001KeyDrug;

/// 其他医学处置名称
Property OtherMedicalDisposition As %String;

/// 根本死因代码
Property DeathReasonCode As %String;

/// 责任医师姓名
Property ChargeDoctorName As %String;

/// 医疗保险类别代码
Property BeneficiaryCode As %String;

/// 医疗付费方式名称
Property PayWayName As %String;

/// 门诊费用金额
Property OutPatientFee As %String;

/// 住院费用金额
Property HospitalizationFee As %String;

/// 个人承担费用金额
Property PersonalFee As %String;

}
