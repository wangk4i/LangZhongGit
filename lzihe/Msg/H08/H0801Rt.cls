Class IHE.Msg.H08.H0801Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 医嘱开立日期时间
Property OrderTime As %String;

/// 医嘱开立者签名
Property AuthorSignatureText As %String;

/// 医务人员工号
Property AuthorWorkNo As %String(MAXLEN = 50);

/// 医嘱开立者
Property AuthorName As %String;

/// 医疗卫生机构（科室）ID
Property RrepresentedOrganizationDeptId As %String(MAXLEN = 50);

/// 医嘱开立科室
Property RrepresentedOrganizationDeptName As %String;

/// 医嘱审核日期时间
Property OrderAuditTime As %String;

/// 医嘱审核者签名
Property OrderAuditVerifierSign As %String;

/// 医务人员工号
Property AuditWorkNo As %String(MAXLEN = 50);

/// 医嘱审核者姓名
Property OrderAuditVerifierName As %String;

/// 医嘱序号
Property OrderInfoNo As %String(MAXLEN = 4);

/// 医嘱ID
Property OrderId As %String(MAXLEN = 50);

/// 医嘱项目类型代码
Property OrderItemTypeId As %String;

/// 医嘱项目类型名称
Property OrderItemTypeName As %String;

/// 医嘱项目内容
Property OrderItemContent As %String;

/// 医嘱开始日期时间
Property OrderTimeLow As %String;

/// 医嘱结束日期时间
Property OrderTimeHigh As %String;

/// 医嘱执行频率编码
Property FrequencyCode As %String;

/// 医嘱执行频率名称
Property FrequencyName As %String;

/// 用药途径
Property PurposeCode As %String;

/// 用药途径描述
Property PurposeName As %String;

/// 用药剂量-单次
Property DoseSingle As %String;

/// 用药剂量-单次用量单位
Property DoseSingleUnit As %String;

/// 药物使用总剂量
Property DoseTotal As %String;

/// 药物使用总剂量单位
Property DoseTotalUnit As %String(MAXLEN = 10);

/// 药物使用总剂量天数
Property DoseTotalDays As %String(MAXLEN = 4);

/// 药物剂型
Property DosageFormCode As %String;

/// 药物剂型描述
Property DosageFormName As %String;

/// 药物编码
Property DrugCode As %String;

/// 药物名称
Property DrugName As %String;

/// 药物规格
Property DrugSpec As %String;

/// 药物规格单位
Property DrugSpecUnit As %String(MAXLEN = 10);

/// 药物医保类别编码
Property DrugMITypeCode As %String(MAXLEN = 50);

/// 药物医保类别名称
Property DrugMITypeName As %String(MAXLEN = 50);

/// 执行科室编码
Property ServiceDeptCode As %String;

/// 执行科室名称
Property ExecutionDeptName As %String;

/// 父医嘱ID
Property ParentOrderId As %String(MAXLEN = 50);

/// 医嘱类别编码
Property OrderTypeCode As %String;

/// 医嘱类别名称
Property OrderTypeCodeName As %String;

/// 领药量
Property TakedDosage As %String(MAXLEN = 10);

/// 领药量单位
Property TakedDosageUnit As %String(MAXLEN = 10);

/// 医嘱备注信息
Property OrderNote As %String(MAXLEN = 200);

/// 医嘱备注信息状态
Property OrderNoteStatus As %String(MAXLEN = 50);

/// 就诊次数
Property VisitNum As %String(MAXLEN = 30);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别编码
Property AdmTypeCode As %String(MAXLEN = 50);

/// 就诊类别名称
Property AdmTypeName As %String(MAXLEN = 50);

/// 域ID
Property DomainId As %String(MAXLEN = 50);

/// 患者ID标识
Property PatientID As %String(MAXLEN = 50);

/// 门（急）诊号标识
Property OutpatientId As %String;

/// 住院号标识
Property HospitalizationId As %String;

/// 患者就医联系电话
Property PatientTelcom As %String;

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 性别代码
Property PatientGenderCode As %String;

/// 患者性别描述
Property GenderName As %String;

/// 出生日期
Property BirthTime As %String;

/// 健康档案编号
Property HealthRecordId As %String;

/// 健康卡号
Property HealthCardCode As %String;

/// 病床号
Property BedNumber As %String;

/// 病床号名称
Property BedName As %String(MAXLEN = 50);

/// 病房号
Property RoomNumber As %String(MAXLEN = 50);

/// 病房号名称
Property RoomName As %String;

/// 科室编码
Property DeptId As %String;

/// 科室名称
Property DeptName As %String;

/// 病区编码
Property InpatientAreaId As %String(MAXLEN = 50);

/// 病区名称
Property InpatientAreaName As %String;

}
