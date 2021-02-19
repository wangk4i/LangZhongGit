<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0042">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.62"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0042" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>转科记录</title>
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
            <!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--住院号标识-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--1数据集里是年龄（年）、年龄（月）-->
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
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
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
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
            <!-- 签名 -->
            <xsl:for-each select="TransOutDoctor">
                <authenticator>
                    <!--转出日期时间-->
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="转出医师签名"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="TransInDoctor">
                <authenticator>
                    <!--转入日期时间-->
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="转入医师签名"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <componentOf>
                <encompassingEncounter>
                    <code displayName="入院日期时间"/>
                    <effectiveTime value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="AdmTime"/>
                        </xsl:attribute>
                    </effectiveTime>
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
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!-- DE08.10.026.00科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="DeptName"/>
                                                        </name>
                                                        <!-- DE08.10.054.00病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="AreaName"/>
                                                                </name>
                                                                <!--医疗机构名称 -->
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
                    <!--
        *******************************************************
        主诉章节
        *******************************************************
        -->
                    <component>
                        <section>
                            <code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP" contextConductionInd="true">
                                <!-- 主诉-->
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.119.00" displayName="主诉" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChiefComplaintsDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--**************************************************
        入院诊断章节
        ******************************************************
        -->
                    <!--入院诊断章节-->
                    <component>
                        <section>
                            <code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX"/>
                            <text/>
                            <!--入院情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE05.10.148.00" displayName="入院情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AdmCondition"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-西医诊断编码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="入院诊断-西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" displayName="" codeSystemName="ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AdmWesternDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AdmWesternDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-中医病名代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="入院诊断-中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医病名代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AdmChineseDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AdmChineseDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--入院诊断-中医证候代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="入院诊断-中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医证候代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AdmChineseSymptomCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AdmChineseSymptomName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
        ********************************************************
        诊断章节
        ********************************************************
        -->
                    <!--诊断记录章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目:目前情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE06.00.184.00" displayName="目前情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentCondition"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="目前诊断-西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="K56.700" codeSystem="2.16.156.10011.2.3.3.11" displayName="肠梗阻" codeSystemName="ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PreWesternDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PreWesternDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-中医病名代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="目前诊断-中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医病名代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PreChineseDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PreChineseDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--目前诊断-中医证候代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" displayName="目前诊断-中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                        <qualifier>
                                            <name displayName="中医证候代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PreChineseSymptomCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PreChineseSymptomName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChineseObserveDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
        ********************************************************
        治疗计划章节
        ********************************************************
        -->
                    <!--计划章节 1..*-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!-- 转入诊疗计划 患者转入科室后的诊疗计划，具体的检查、中西医治疗措施及中医调护-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.298.00" displayName="转入诊疗计划" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TransInDiagPlan"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--治则治法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrincipleDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--注意事项-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE09.00.119.00" displayName="注意事项" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="Notice"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
        ************************************************
        转科记录章节
        ************************************************
        -->
                    <component>
                        <section>
                            <code displayName="转科记录"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS " moodCode="EVN">
                                    <code code="DE06.00.314.00" displayName="转科记录类型" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.56" codeSystemName="转科记录类型代码表" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="TransTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="TransTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--转出科室-->
                            <entry>
                                <observation classCode="OBS " moodCode="EVN ">
                                    <code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="转出科室名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TransOutDeptName"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--转入科室-->
                            <entry>
                                <observation classCode="OBS " moodCode="EVN ">
                                    <code code="DE08.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="转入科室名称"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TransInDeptName"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--转科目的-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.315.00" displayName="转科目的" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TransPurposeDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
        ********************************************************
        用药章节
        ********************************************************
        -->
                    <component>
                        <section>
                            <code code="10160-0" displayName="HISTORY OF MEDICATION USE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS " moodCode="EVN ">
                                    <code code="DE06.00.287.00" displayName="中药处方医嘱内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMPrescriptionOrder"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--中药煎煮方法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE08.50.047.00" displayName="中药煎煮方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMDecoctingMethod"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--中药用药方法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE06.00.136.00" displayName="中药用药方法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TCMUseMethod"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
        ****************************************************
        住院过程章节
        ****************************************************
        -->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
                            <text/>
                            <!--诊疗过程描述-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.296.00" displayName="诊疗过程描述" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiagProcessDesc"/>
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