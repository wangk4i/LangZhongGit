Class IHE.Test.CDA.C0001 Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.CDA.C0001).%New()

	s msg.DocID = "文档流水号标识"
    s msg.CreateTime = "文档机器生成时间"
    s msg.DocSetID = "文档集合编号"
    s msg.Version = "文档版本号"
    s msg.HealthRecordCode = "健康档案标识号"
    s msg.HealthCardCode = "健康卡号"
    
    s PatientAddr = ##class(IHE.Msg.CDA.Common.Address).%New()
    s PatientAddr.HouseNumber = "地址-门牌号码"
    s PatientAddr.StreetName = "现住地址-村（街、路、弄等）"
    s PatientAddr.Township = "地址-乡（镇、街道办事处）"
    s PatientAddr.County = "地址-县（区）"
    s PatientAddr.City = "地址-市（地区）"
    s PatientAddr.State = "地址-省（自治区、直辖市）"
    s PatientAddr.PostalCode = "邮政编码"
    s msg.PatientAddr = PatientAddr
    
    s msg.TelPhone = "患者联系电话"
    
    s PatientInfo = ##class(IHE.Msg.CDA.Common.Patient).%New()
    s PatientInfo.IDCardNo = "患者身份证号"
    s PatientInfo.PatientName = "患者姓名"
    s PatientInfo.GenderCode = "患者性别代码"
    s PatientInfo.GenderName = "患者性别名称"
    s PatientInfo.BirthTime = "患者出生日期"
    s msg.PatientInfo = PatientInfo
    
    s msg.MarriageCode = "患者婚姻状况代码"
    s msg.MarriageValue = "患者婚姻状况名称"
    s msg.NationCode = "民族代码"
    s msg.NationValue = "民族名称"
    
    s Occupation = ##class(IHE.Msg.CDA.C0001Occupation).%New()
    s Occupation.OccupationValue = "工作单位名称"
    s Occupation.OccupationTelPhone = "工作单位电话"
    d msg.Occupation.Insert(Occupation)
    d msg.Occupation.Insert(Occupation)
    d msg.Occupation.Insert(Occupation)
    
    s msg.EmployerTypeCode = "职业类别代码"
    s msg.EmployerTypeName = "职业类别名称"
    s msg.RecordTime = "建档日期时间"
    s msg.AuthorCode = "作者的唯一标识符"
    s msg.AuthorName = "建档者姓名"
    s msg.ScopingOrgCode = "建档医疗机构"
    s msg.ScopingOrgName = "医疗机构名称"
    s msg.CustodianOrgCode = "保管机构代码"
    s msg.CustodianOrgName = "保管机构名称"
    
    s Contacts = ##class(IHE.Msg.CDA.C0001Contacts).%New()
    s ContactsAddr = ##class(IHE.Msg.CDA.Common.Address).%New()
    s ContactsAddr.HouseNumber = "联系人地址-门牌号码"
    s ContactsAddr.StreetName = "联系人现住地址-村（街、路、弄等）"
    s ContactsAddr.Township = "联系人地址-乡（镇、街道办事处）"
    s ContactsAddr.County = "联系人地址-县（区）"
    s ContactsAddr.City = "联系人地址-市（地区）"
    s ContactsAddr.State = "联系人地址-省（自治区、直辖市）"
    s ContactsAddr.PostalCode = "联系人邮政编码"
    s Contacts.ContactsAddr = ContactsAddr
    s Contacts.ContactsTelPhone = "联系人电话号码"
    s Contacts.ContactsName = "联系人姓名"
    d msg.Contacts.Insert(Contacts)
    d msg.Contacts.Insert(Contacts)
    d msg.Contacts.Insert(Contacts)
    
    s msg.ParentDocID = "父文档标识符"
    s msg.ParentDocSetID = "文档集序列号"
    s msg.ParentVersion = "文档版本号"
    s msg.PatientABOCode = "ABO血型代码"
    s msg.PatientABODescribe = "ABO血型名称"
    s msg.PatientRHCode = "Rh血型代码"
    s msg.PatientRHDescribe = "Rh血型名称"
    
    d msg.HoD.Insert("疾病史（含外伤）描述")
    d msg.HoD.Insert("疾病史（含外伤）描述")
    d msg.HoD.Insert("疾病史（含外伤）描述")
    
    d msg.HoID.Insert("传染病史描述")
    d msg.HoID.Insert("传染病史描述")
    d msg.HoID.Insert("传染病史描述")
    
    d msg.HoO.Insert("手术史描述")
    d msg.HoO.Insert("手术史描述")
    d msg.HoO.Insert("手术史描述")
    
    d msg.HoM.Insert("婚育史描述")
    d msg.HoM.Insert("婚育史描述")
    d msg.HoM.Insert("婚育史描述")
    
    s msg.HoT = "输血史描述"
    
    d msg.HoA.Insert("过敏史描述")
    d msg.HoA.Insert("过敏史描述")
    d msg.HoA.Insert("过敏史描述")
    
    d msg.HoI.Insert("预防接种史描述")
    d msg.HoI.Insert("预防接种史描述")
    d msg.HoI.Insert("预防接种史描述")
    
    s msg.HoP = "个人史描述"
    s msg.HoPenses = "月经史描述"
    
    d msg.HoF.Insert("家族史描述")
    d msg.HoF.Insert("家族史描述")
    d msg.HoF.Insert("家族史描述")
    
    s msg.HospitalDeptName = "医疗机构科室名称"
    s msg.PatientTypeCode = "患者类型代码"
    s msg.OutPatientID = "门（急）诊号"
    s msg.HospitalizationID = "住院号"
    s msg.EncounterTime = "入院日期"
    s msg.DischargeTime = "出院日期"
    s msg.IllnessTime = "发病日期时间"
    s msg.AdmReason = "就诊原因描述"
    s msg.AdmTime = "就诊日期时间"
    
    s WesternDiag = ##class(IHE.Msg.CDA.C0001WesternDiag).%New()
    s WesternDiag.WesternDiagCode = "西医诊断代码"
    s WesternDiag.WesternDiagName = "西医诊断名称"
    s WesternDiag.WesternTransderredCode = "西医病情归转代码"
    s WesternDiag.WesternTransderredName = "西医病情归转名称"
    d msg.WesternDiag.Insert(WesternDiag)
    d msg.WesternDiag.Insert(WesternDiag)
    d msg.WesternDiag.Insert(WesternDiag)
    
    s msg.OtherWesternDiagCode = "其他西医诊断代码"
    s msg.OtherWesternDiagName = "其他西医诊断名称"
    
    s ChineseDiag = ##class(IHE.Msg.CDA.C0001ChineseDiag).%New()
    s ChineseDiag.ChineseDiagCode = "中医病名代码"
    s ChineseDiag.ChineseSyndromeCode = "中医证候代码"
    s ChineseDiag.ChineseTransderredCode = "中医病情归转代码"
    s ChineseDiag.ChineseTransderredName = "中医病情归转描述"
    d msg.ChineseDiag.Insert(ChineseDiag)
    d msg.ChineseDiag.Insert(ChineseDiag)
    d msg.ChineseDiag.Insert(ChineseDiag)
    
    d msg.OperationCode.Insert("手术及操作代码")
    d msg.OperationCode.Insert("手术及操作代码")
    d msg.OperationCode.Insert("手术及操作代码")
    
    s KeyDrug = ##class(IHE.Msg.CDA.C0001KeyDrug).%New()
    s KeyDrug.KeyDrugName = "关键药物名称"
    s KeyDrug.KeyDrugUseFunction = "关键药物用法名称"
    s KeyDrug.DrugAdverseReaction = "药物不良反应情况名称"
    s KeyDrug.ChineseDurgTypeCode = "中药使用类别代码"
    d msg.KeyDrug.Insert(KeyDrug)
    d msg.KeyDrug.Insert(KeyDrug)
    d msg.KeyDrug.Insert(KeyDrug)
    
    s msg.OtherMedicalDisposition = "其他医学处置名称"
    s msg.DeathReasonCode = "根本死因代码"
    s msg.ChargeDoctorName = "责任医师姓名"
    s msg.BeneficiaryCode = "医疗保险类别代码"
    s msg.PayWayName = "医疗付费方式名称"
    s msg.OutPatientFee = "门诊费用金额"
    s msg.HospitalizationFee = "住院费用金额"
    s msg.PersonalFee = "个人承担费用金额"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
