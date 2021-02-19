Class IHE.Test.CDA.C0034 Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.CDA.C0034).%New()
	b
	s msg.DocID = "文档流水号标识"
	s msg.CreateTime = "文档机器生成时间"
	s msg.DocSetID = "文档集合编号"
	s msg.Version = "文档版本号"
	s msg.HospitalizationID = "住院号标识"
	
	s msg.LivingAddress = ##Class(IHE.Msg.CDA.Common.Address).%New()
	s msg.LivingAddress.HouseNumber = "家庭住址门牌号码"
	s msg.LivingAddress.StreetName = "家庭住址村"
	s msg.LivingAddress.Township = "家庭住址乡"
	s msg.LivingAddress.County = "家庭住址县"
	s msg.LivingAddress.City = "家庭住址市"
	s msg.LivingAddress.State = "家庭住址省"
	
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.GenderCode = "患者性别代码"
	s msg.GenderName = "患者性别名称"
	s msg.MarriageCode = "婚姻状况代码"
	s msg.MarriageName = "婚姻状况名称"
	s msg.NationCode = "民族代码"
	s msg.NationName = "民族名称"
	s msg.Age = "年龄"
	s msg.OccupationCode = "职业类别代码"
	s msg.OccupationName = "职业类别名称"
	s msg.RecordTime = "文档记录时间"
	s msg.AuthorCode = "文档作者标识"
	s msg.AuthorName = "文档作者姓名"
	
	s HistoryTellerItem = ##class(IHE.Msg.CDA.Common.Proxy).%New()
	s HistoryTellerItem.Code = "陈述者代码"
	s HistoryTellerItem.RelCode = "陈述者与患者的关系代码"
	s HistoryTellerItem.RelName = "陈述者与患者的关系名称"
	s HistoryTellerItem.Name = "陈述者姓名"
	s msg.HistoryTeller = HistoryTellerItem
	
	s msg.CustodianOrgCode = "文档保管机构标识"
	s msg.CustodianOrgName = "文档保管机构名称"
	
	s msg.FinalReviewer = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s msg.FinalReviewer.Code = "最终审核者代码"
	s msg.FinalReviewer.Name = "最终审核者姓名"
	
	s msg.DiagDoctor = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s msg.DiagDoctor.Code = "接诊医师代码"
	s msg.DiagDoctor.Name = "接诊医师姓名"
	
	s msg.ResidentDoctor = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s msg.ResidentDoctor.Code = "住院医师代码"
	s msg.ResidentDoctor.Name = "住院医师姓名"
	
	s msg.AttendingDoctor = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s msg.AttendingDoctor.Code = "主治医师代码"
	s msg.AttendingDoctor.Name = "主治医师姓名"
	
	s msg.AdmTime = "入院时间"
	
	s msg.Hospital = ##class(IHE.Msg.CDA.Common.RelatedOrgan).%New()
	s msg.Hospital.BedCode = "病床号"
	s msg.Hospital.BedName = "病床名称"
	s msg.Hospital.RoomCode = "病房号"
	s msg.Hospital.RoomName = "病房名称"
	s msg.Hospital.DeptCode = "科室代码"
	s msg.Hospital.DeptName = "科室名称"
	s msg.Hospital.AreaCode = "病区代码"
	s msg.Hospital.AreaName = "病区名称"
	s msg.Hospital.OrganCode = "医院代码"
	s msg.Hospital.OrganName = "医院名称"
	
	s msg.ChiefComplaintsDesc = "主诉描述"
	s msg.PresentIllnessDesc = "现病史描述"
	s msg.HealthStatusSign = "一般健康状况标志"
	s msg.HoD = "疾病史（含外伤）描述"
	s msg.InfectiousSign = "患者传染性标志"
	s msg.HoID = "传染病史"
	
	s HoMItem = "婚育史"
	d msg.HoM.Insert(HoMItem)
	d msg.HoM.Insert(HoMItem)
	s HoAItem = "过敏史"
	d msg.HoA.Insert(HoAItem)
	d msg.HoA.Insert(HoAItem)
	s HoOItem = "手术史"
	d msg.HoO.Insert(HoOItem)
	d msg.HoO.Insert(HoOItem)
	
	s msg.HoV = "预防接种史"
	s msg.HoT = "输血史"
	s msg.HoP = "个人史"
	s msg.HoMenstruation = "月经史"
	
	s HoFItem = "家族史"
	d msg.HoF.Insert(HoFItem)
	d msg.HoF.Insert(HoFItem)
	
	s msg.Temperature = "体温(℃)"
	s msg.PulseRate = "脉率（次/min)"
	s msg.BreathRate = "呼吸频率（次/min)"
	s msg.SystolicPressure = "收缩压"
	s msg.DiastolicPressure = "舒张压"
	s msg.PatientHeight = "身高(cm)"
	s msg.PatientWeight = "体重(kg)"
	s msg.GeneralExamResult = "一般状况检查结果"
	s msg.SkinMucosaExamResult = "皮肤和黏膜检查结果"
	s msg.SuperficialLymphExamResult = "全身浅表淋巴结检查结果"
	s msg.HeadExamResult = "头部及其器官检查结果"
	s msg.NeckExamResult = "颈部检查结果"
	s msg.ChestExamResult = "胸部检查结果"
	s msg.AbdomenExamResult = "腹部检查结果"
	s msg.DigitalAnalExamResult = "肛门指诊检查结果描述"
	s msg.ExternalGenitaliaExamResult = "外生殖器检查结果"
	s msg.SpineExamResult = "脊柱检查结果"
	s msg.LimbsExamResult = "四肢检查结果"
	s msg.NervousSystemExamResult = "神经系统检查结果"
	s msg.SpecialExamResult = "专科情况"
	
	s AuxExamResultItem = "辅助检查结果"
	d msg.AuxExamResult.Insert(AuxExamResultItem)
	d msg.AuxExamResult.Insert(AuxExamResultItem)

	s msg.StatementReliableSign = "陈述内容可靠标志"
	
	s msg.PreWesternDiag = ##class(IHE.Msg.CDA.C0034WesternDiag).%New()
	s msg.PreWesternDiag.Time = "初步诊断-西医诊断日期"
	s msg.PreWesternDiag.Value = "初步诊断-西医诊断疾病名称"
	s msg.PreWesternDiag.Code = "初步诊断-西医诊断代码"
	s msg.PreWesternDiag.Name = "初步诊断-西医诊断名称"
	s msg.PreWesternDiag.AdmSequence = "初步诊断-西医入院诊断顺位"
	
	s msg.ChineseObserveDiagResult = "中医“四诊“观察结果"
	
	s msg.PreChineseDiag = ##class(IHE.Msg.CDA.C0034ChineseDiag).%New()
	s msg.PreChineseDiag.Time = "初步诊断-中医诊断日期"
	s msg.PreChineseDiag.Value = "初步诊断-中医诊断疾病病名"
	s msg.PreChineseDiag.Code = "初步诊断-中医诊断代码"
	s msg.PreChineseDiag.Name = "初步诊断-中医诊断名称"
	s msg.PreChineseDiag.SymptomValue = "初步诊断-中医证候病名"
	s msg.PreChineseDiag.SymptomCode = "初步诊断-中医证候代码"
	s msg.PreChineseDiag.SymptomName = "初步诊断-中医证候名称"
	s msg.PreChineseDiag.AdmSequence = "初步诊断-中医入院诊断顺位"

	s msg.CorrectWesternDiag = ##class(IHE.Msg.CDA.C0034WesternDiag).%New()
	s msg.CorrectWesternDiag.Time = "修正诊断-西医诊断日期"
	s msg.CorrectWesternDiag.Value = "修正诊断-西医诊断疾病名称"
	s msg.CorrectWesternDiag.Code = "修正诊断-西医诊断代码"
	s msg.CorrectWesternDiag.Name = "修正诊断-西医诊断名称"
	s msg.CorrectWesternDiag.AdmSequence = "修正诊断-西医入院诊断顺位"
	
	s msg.CorrectChineseDiag = ##class(IHE.Msg.CDA.C0034ChineseDiag).%New()
	s msg.CorrectChineseDiag.Time = "修正诊断-中医诊断日期"
	s msg.CorrectChineseDiag.Value = "修正诊断-中医诊断疾病名称"
	s msg.CorrectChineseDiag.Code = "修正诊断-中医诊断代码"
	s msg.CorrectChineseDiag.Name = "修正诊断-中医诊断名称"
	s msg.CorrectChineseDiag.SymptomValue = "修正诊断-中医证候病名"
	s msg.CorrectChineseDiag.SymptomCode = "修正诊断-中医证候代码"
	s msg.CorrectChineseDiag.SymptomName = "修正诊断-中医证候名称"
	s msg.CorrectChineseDiag.AdmSequence = "修正诊断-中医入院诊断顺位"

	s ConfirmWesternDiagItem = ##class(IHE.Msg.CDA.C0034WesternDiag).%New()
	s ConfirmWesternDiagItem.Time = "确定诊断-西医诊断日期"
	s ConfirmWesternDiagItem.Value = "确定诊断-西医诊断疾病名称"
	s ConfirmWesternDiagItem.Code = "确定诊断-西医诊断代码"
	s ConfirmWesternDiagItem.Name = "确定诊断-西医诊断名称"
	s ConfirmWesternDiagItem.AdmSequence = "确定诊断-西医入院诊断顺位"
	d msg.ConfirmWesternDiag.Insert(ConfirmWesternDiagItem)
	d msg.ConfirmWesternDiag.Insert(ConfirmWesternDiagItem)

	s msg.ConfirmChineseDiag = ##class(IHE.Msg.CDA.C0034ChineseDiag).%New()
	s msg.ConfirmChineseDiag.Time = "确定诊断-中医诊断日期"
	s msg.ConfirmChineseDiag.Value = "确定诊断-中医诊断疾病名称"
	s msg.ConfirmChineseDiag.Code = "确定诊断-中医诊断代码"
	s msg.ConfirmChineseDiag.Name = "确定诊断-中医诊断名称"
	s msg.ConfirmChineseDiag.SymptomValue = "确定诊断-中医证候病名"
	s msg.ConfirmChineseDiag.SymptomCode = "确定诊断-中医证候代码"
	s msg.ConfirmChineseDiag.SymptomName = "确定诊断-中医证候名称"
	s msg.ConfirmChineseDiag.AdmSequence = "确定诊断-中医入院诊断顺位"

	s msg.SupWesternDiag = ##class(IHE.Msg.CDA.C0034WesternDiag).%New()
	s msg.SupWesternDiag.Time = "补充诊断-西医诊断日期"
	s msg.SupWesternDiag.Value = "补充诊断-西医诊断疾病名称"
	s msg.SupWesternDiag.Code = "补充诊断-西医诊断代码"
	s msg.SupWesternDiag.Name = "补充诊断-西医诊断名称"
	s msg.SupWesternDiag.AdmSequence = "补充诊断-西医入院诊断顺位"


	s msg.TreatmentPrincipleDesc = "治则治法"
	
	
	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
