Class IHE.Msg.CDA.C0034 Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.CDA.Common.DocHead, IHE.Msg.CDA.Common.Patient) [ Language = objectscript ]
{

/// 住院号标识
Property HospitalizationID As %String;

/// 家庭住址
Property LivingAddress As IHE.Msg.CDA.Common.Address;

/// 陈述者
Property HistoryTeller As IHE.Msg.CDA.Common.Proxy;

/// 最终审核者
Property FinalReviewer As IHE.Msg.CDA.Common.RelatedPerson;

/// 接诊医师
Property DiagDoctor As IHE.Msg.CDA.Common.RelatedPerson;

/// 住院医师
Property ResidentDoctor As IHE.Msg.CDA.Common.RelatedPerson;

/// 主治医师
Property AttendingDoctor As IHE.Msg.CDA.Common.RelatedPerson;

/// 入院时间
Property AdmTime As %String;

/// 住院机构
Property Hospital As IHE.Msg.CDA.Common.RelatedOrgan;

/// 主诉描述
Property ChiefComplaintsDesc As %String;

/// 现病史描述
Property PresentIllnessDesc As %String;

/// 一般健康状况标志
Property HealthStatusSign As %String;

/// 疾病史（含外伤）描述
Property HoD As %String;

/// 患者传染性标志
Property InfectiousSign As %String;

/// 传染病史
Property HoID As %String;

/// 婚育史
Property HoM As list Of %String;

/// 过敏史
Property HoA As list Of %String;

/// 手术史
Property HoO As list Of %String;

/// 预防接种史
Property HoV As %String;

/// 输血史
Property HoT As %String;

/// 个人史
Property HoP As %String;

/// 月经史
Property HoMenstruation As %String;

/// 家族史
Property HoF As list Of %String;

/// 体温(℃)
Property Temperature As %String;

/// 脉率（次/min)
Property PulseRate As %String;

/// 呼吸频率（次/min)
Property BreathRate As %String;

/// 收缩压
Property SystolicPressure As %String;

/// 舒张压
Property DiastolicPressure As %String;

/// 身高(cm)
Property PatientHeight As %String;

/// 体重(kg)
Property PatientWeight As %String;

/// 一般状况检查结果
Property GeneralExamResult As %String;

/// 皮肤和黏膜检查结果
Property SkinMucosaExamResult As %String;

/// 全身浅表淋巴结检查结果
Property SuperficialLymphExamResult As %String;

/// 头部及其器官检查结果
Property HeadExamResult As %String;

/// 颈部检查结果
Property NeckExamResult As %String;

/// 胸部检查结果
Property ChestExamResult As %String;

/// 腹部检查结果
Property AbdomenExamResult As %String;

/// 肛门指诊检查结果描述
Property DigitalAnalExamResult As %String;

/// 外生殖器检查结果
Property ExternalGenitaliaExamResult As %String;

/// 脊柱检查结果
Property SpineExamResult As %String;

/// 四肢检查结果
Property LimbsExamResult As %String;

/// 神经系统检查结果
Property NervousSystemExamResult As %String;

/// 专科情况
Property SpecialExamResult As %String;

/// 辅助检查结果
Property AuxExamResult As list Of %String;

/// 陈述内容可靠标志
Property StatementReliableSign As %String;

/// 初步诊断-西医诊断
Property PreWesternDiag As IHE.Msg.CDA.C0034WesternDiag;

/// 中医“四诊“观察结果
Property ChineseObserveDiagResult As %String;

/// 初步诊断-中医诊断
Property PreChineseDiag As IHE.Msg.CDA.C0034ChineseDiag;

/// 修正诊断-西医诊断
Property CorrectWesternDiag As IHE.Msg.CDA.C0034WesternDiag;

/// 修正诊断-中医诊断
Property CorrectChineseDiag As IHE.Msg.CDA.C0034ChineseDiag;

/// 确定诊断-西医诊断
Property ConfirmWesternDiag As list Of IHE.Msg.CDA.C0034WesternDiag;

/// 确定诊断-中医诊断
Property ConfirmChineseDiag As IHE.Msg.CDA.C0034ChineseDiag;

/// 补充诊断-西医诊断
Property SupWesternDiag As IHE.Msg.CDA.C0034WesternDiag;

/// 治则治法
Property TreatmentPrincipleDesc As %String;

}
