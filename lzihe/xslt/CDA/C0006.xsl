<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0006">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.26"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0006" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>检查报告</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <languageCode code="zh-CN"/>
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <!--文档记录对象（患者）-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--门（急）诊号标识 -->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
                    <!--住院号标识-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!--检查报告单号标识-->
                    <id root="2.16.156.10011.1.32" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ExaminationReportID"/>
                        </xsl:attribute>
                    </id>
                    <!--电子申请单编号-->
                    <id root="2.16.156.10011.1.24" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ApplyID"/>
                        </xsl:attribute>
                    </id>
                    <!-- 标本编号标识 -->
                    <id root="2.16.156.10011.1.14" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="SpecimenID"/>
                        </xsl:attribute>
                    </id>
                    <!-- 患者类别代码 -->
                    <patientType>
                        <patienttypeCode code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者 类型代码表" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientTypeCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientTypeName"/>
                            </xsl:attribute>
                        </patienttypeCode>
                    </patientType>
                    <xsl:for-each select="Telecom/TelecomItem">
                        <telecom value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each >
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!-- 年龄 -->
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 检查报告医师（文档创作者） -->
            <author typeCode="AUT" contextControlCode="OP">
                <!-- 检查报告日期 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="RecordTime"/>
                    </xsl:attribute>
                </time>
                <assignedAuthor classCode="ASSIGNED">
                    <id root="2.16.156.10011.1.7" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuthorCode"/>
                        </xsl:attribute>
                    </id>
                    <!-- 医师姓名 -->
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 保管机构 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="CustodianOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="CustodianOrgName"/>
                        </name>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <!-- 审核医师签名 -->
            <legalAuthenticator>
                <time/>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuditPersonInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="审核医师"/>
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                        <name>
                            <xsl:value-of select="AuditPersonInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 检查技师签名 -->
            <authenticator>
                <time/>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ExamPersonInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="检查技师"/>
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                        <name>
                            <xsl:value-of select="ExamPersonInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!-- 检查医师签名 -->
            <authenticator>
                <time/>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ExamDoctorInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="检查医师"/>
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                        <name>
                            <xsl:value-of select="ExamDoctorInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!-- 检查申请机构及科室 -->
            <participant typeCode="PRF">
                <time/>
                <associatedEntity classCode="ASSIGNED">
                    <scopingOrganization>
                        <id root="2.16.156.10011.1.26"/>
                        <name>
                            <xsl:value-of select="ExamApplyDeptName"/>
                        </name>
                        <asOrganizationPartOf>
                            <wholeOrganization>
                                <id root="2.16.156.10011.1.5" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="ExamApplyOrgCode"/>
                                    </xsl:attribute>
                                </id>
                                <name>
                                    <xsl:value-of select="ExamApplyOrgName"/>
                                </name>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </scopingOrganization>
                </associatedEntity>
            </participant>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <!-- 病床号、病房、病区、科室和医院的关联 -->
            <componentOf>
                <encompassingEncounter>
                    <effectiveTime/>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <!-- DE08.10.026.00科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26"/>
                                                        <name>
                                                            <xsl:value-of select="DeptName"/>
                                                        </name>
                                                        <!-- DE08.10.054.00病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27"/>
                                                                <name>
                                                                    <xsl:value-of select="AreaName"/>
                                                                </name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="">
                                                                            <xsl:attribute name="extension">
                                                                                <xsl:value-of select="OrganCode"/>
                                                                            </xsl:attribute>
                                                                        </id>
                                                                        <name>
                                                                            <xsl:value-of select="OrganName"/>
                                                                        </name>
                                                                    </wholeOrganization>
                                                                </asOrganizationPartOf>
                                                            </wholeOrganization>
                                                        </asOrganizationPartOf>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </serviceProviderOrganization>
                        </healthCareFacility>
                    </location>
                </encompassingEncounter>
            </componentOf>
            <!--***************************************************
          文档体Body
          *******************************************************
          -->
            <component>
                <structuredBody>
                    <!-- 诊断记录章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目：诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <!--诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DiagnosisTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                    <performer>
                                        <assignedEntity>
                                            <id/>
                                            <representedOrganization>
                                                <name>
                                                    <xsl:value-of select="DiagOrgName"/>
                                                </name>
                                            </representedOrganization>
                                        </assignedEntity>
                                    </performer>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 主诉章节 -->
                    <component>
                        <section>
                            <code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--主诉条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主诉"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChiefComplaintsDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 症状章节 -->
                    <component>
                        <section>
                            <code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PROBLEM LIST"/>
                            <text/>
                            <!-- 症状描述条目 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.117.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="症状描述"/>
                                    <!-- 症状开始时间与停止时间 -->
                                    <effectiveTime>
                                        <low value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="SymptomTimeLow"/>
                                            </xsl:attribute>
                                        </low>
                                        <high value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="SymptomTimeHigh"/>
                                            </xsl:attribute>
                                        </high>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SymptomDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 手术操作章节 -->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OperationInfo/row">
                                <entry>
                                    <!-- 1..1 手术记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
                                            </xsl:attribute>
                                        </code>
                                        <statusCode/>
                                        <!--操作日期/时间-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OperationTime"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <!-- 操作部位代码 -->
                                        <targetSiteCode code="" codeSystem="2.16.156.10011.2.3.1.266" codeSystemName="操作部位代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationPartCode"/>
                                            </xsl:attribute>
                                        </targetSiteCode>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationOPSName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="InterventionName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.251.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作方法描述"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationMethodDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.250.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="操作次数"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationNum"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!-- 0..1 麻醉信息 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
                                                <value code="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AnesthesiaCode"/>
                                                    </xsl:attribute>
                                                </value>
                                                <!-- 麻醉医师签名 -->
                                                <performer>
                                                    <assignedEntity>
                                                        <id/>
                                                        <assignedPerson>
                                                            <name>
                                                                <xsl:value-of select="AnesthesiaDoctorName"/>
                                                            </name>
                                                        </assignedPerson>
                                                    </assignedEntity>
                                                </performer>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉观察结果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthesiaResult"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.307.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉中西医标识代码"/>
                                                <value code="" codeSystem="2.16.156.10011.2.3.2.41" codeSystemName="麻醉中西医标识代码表" xsi:type="CD">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AnesthesiaTypeCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 体格检查章节-->
                    <component>
                        <section>
                            <code code="29545-1" displayName="PHYSICAL EXAMINATION" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--特殊检查条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.01.079.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊检查标志"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SpecialExamSign"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查方法名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ExamMethodName"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查类别"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ExamTypeName"/>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="ExamInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.50.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查项目代码"/>
                                                <!-- 检查日期 -->
                                                <effectiveTime value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="ExamTime"/>
                                                    </xsl:attribute>
                                                </effectiveTime>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="ExamItemCode"/>
                                                </value>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.50.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="">
                                                            <xsl:attribute name="displayName">
                                                                <xsl:value-of select="SpecimenSmapTypeName"/>
                                                            </xsl:attribute>
                                                        </code>
                                                        <!-- DE04.50.137.00标本采样日期时间DE04.50.141.00 接收标本日期时间 -->
                                                        <effectiveTime>
                                                            <low value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="SpecimenSmapTimeLow"/>
                                                                </xsl:attribute>
                                                            </low>
                                                            <high value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="SpecimenSmapTimeHigh"/>
                                                                </xsl:attribute>
                                                            </high>
                                                        </effectiveTime>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="SpecialExamName"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.50.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本状态"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="SpecimenStatus"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE08.50.027.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="标本固定液名称"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="SpecimanFixativeName"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.017.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="-"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.38" codeSystemName="检查/检验结果代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ExamResultCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.015.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查定量结果"/>
                                                <value xsi:type="REAL" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="ExamQuantityResult"/>
                                                    </xsl:attribute>
                                                </value>
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE04.30.016.00" displayName="检查定量 结果计量单位" codeSystemName="卫生信息数据元目录" codeSystem="2.16.156.10011.2.2.1"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="ExamQuantityUnit"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 其他处置章节 -->
                    <component>
                        <section>
                            <code displayName="其他处置章节"/>
                            <text/>
                            <!-- 诊疗过程描述 -->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiagProcessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 检查报告章节 -->
                    <component>
                        <section>
                            <code displayName="检查报告"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.131.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查报告结果-客观所见"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportObjectiveDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.132.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查报告结果-主观提示"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportSubjectiveDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查报告科室"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportDeptName"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查报告机构名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportOrgName"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="检查报告备注"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ReportNote"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>

    </xsl:template>
</xsl:stylesheet>