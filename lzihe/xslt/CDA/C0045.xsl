<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0045">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.65"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0045" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>会诊记录</title>
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
                    <!--电子申请单编号标识-->
                    <id root="2.16.156.10011.1.24" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ApplyID"/>
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
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!--1数据集里是年龄（年）、年龄（月）-->
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
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
            <!-- 会诊申请相关 -->
            <!--会诊医师相关-->
            <xsl:for-each select="ConsultApplyDoctor/row">
                <authenticator>
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
                        <code displayName="会诊申请医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--会诊医师相关-->
            <xsl:for-each select="ConsultDoctor/row">
                <authenticator>
                    <!--会诊日期时间-->
                    <time xsi:type="TS" value="">
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
                        <code displayName="会诊医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                        <!--会诊医师所在医疗机构名称-->
                        <representedOrganization>
                            <name>
                                <xsl:value-of select="OrganName"/>
                            </name>
                        </representedOrganization>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--会诊申请医疗机构名称-->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ConsultTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id/>
                    <code displayName="会诊申请医疗机构"/>
                    <representedOrganization>
                        <asOrganizationPartOf>
                            <wholeOrganization>
                                <id root="2.16.156.10011.1.26" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="ConsultApplyDeptCode"/>
                                    </xsl:attribute>
                                </id>
                                <name>
                                    <xsl:value-of select="ConsultApplyDeptName"/>
                                </name>
                                <asOrganizationPartOf>
                                    <wholeOrganization>
                                        <id root="2.16.156.10011.1.5" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="ConsultApplyOrganCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="ConsultApplyOrganName"/>
                                        </name>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </representedOrganization>
                </assignedEntity>
            </authenticator>
            <xsl:for-each select="ConsultOrganInfo/row">
                <!--会诊所在医疗机构名称-->
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="ConsultTime"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id/>
                        <code displayName="会诊所在机构"/>
                        <representedOrganization>
                            <asOrganizationPartOf>
                                <wholeOrganization>
                                    <id root="2.16.156.10011.1.26" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="ConsultDeptCode"/>
                                        </xsl:attribute>
                                    </id>
                                    <name>
                                        <xsl:value-of select="ConsultDeptName"/>
                                    </name>
                                    <asOrganizationPartOf>
                                        <wholeOrganization>
                                            <id root="2.16.156.10011.1.5" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="ConsultOrganCode"/>
                                                </xsl:attribute>
                                            </id>
                                            <name>
                                                <xsl:value-of select="ConsultOrganName"/>
                                            </name>
                                        </wholeOrganization>
                                    </asOrganizationPartOf>
                                </wholeOrganization>
                            </asOrganizationPartOf>
                        </representedOrganization>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id>
                        <xsl:value-of select="ParentDocID"/>
                    </id>
                    <setId>
                        <xsl:value-of select="ParentDocSetID"/>
                    </setId>
                    <versionNumber>
                        <xsl:value-of select="ParentVersion"/>
                    </versionNumber>
                </parentDocument>
            </relatedDocument>
            <componentOf>
                <encompassingEncounter>
                    <!--入院时间-->
                    <effectiveTime xsi:type="IVL_TS" value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="EncounterTime"/>
                        </xsl:attribute>
                    </effectiveTime>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                <asOrganizationPartOf classCode="PART">
                                    <!--HDSD00.09.003 DE01.00.026.00 病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!--HDSD00.09.004 DE01.00.019.00 病房号 -->
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
                                                <!--HDSD00.09.036 DE08.10.026.00 科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <!--科室名称-->
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="DeptName"/>
                                                        </name>
                                                        <asOrganizationPartOf classCode="PART">
                                                            <!--病区名称-->
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
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
            <!--
            ***************************************************
            文档体Body
            ***************************************************
            -->
            <component>
                <structuredBody>
                    <!--
                    **************************************************
                    健康评估章节
                    **************************************************
                    -->
                    <!--健康评估章节-->
                    <component>
                        <section>
                            <code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <!-- 病历摘要-->
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.182.00" displayName="病历摘要" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="MRAdstract"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    *********************************************
                    诊断章节
                    *********************************************
                    -->
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--西医诊断-->
                            <xsl:for-each select="WMDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN ">
                                        <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="西医诊断名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="诊断代码表ICD-10">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--中医病名-->
                            <xsl:for-each select="TCMDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN ">
                                        <code code="DE05.10.172.00" displayName="中医诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                            <qualifier>
                                                <name displayName="中医诊断名称"/>
                                            </qualifier>
                                        </code>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医病名代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--中医证候-->
                            <xsl:for-each select="TCMSyndromeInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN ">
                                        <code code="DE05.10.172.00" displayName="中医诊断症候名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                            <qualifier>
                                                <name displayName="中医证候名称"/>
                                            </qualifier>
                                        </code>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="TCMSyndromeName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医证候代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="TCMSyndromeCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--中医“四诊”观察结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentTCMDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    *********************************************
                    辅助检查章节
                    *********************************************
                    -->
                    <component>
                        <section>
                            <code displayName="辅助检查章节"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.009.00" displayName="辅助检查结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AidedExamResult"/>
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
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--诊疗过程名称-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN ">
                                    <code code="DE06.00.297.00" displayName="诊疗过程名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentName"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--治则治法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrinciple"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--会诊目的-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.214.00" displayName="会诊目的" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ConsultPurpose"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    会诊原因章节
                    ********************************************************
                    -->
                    <!--会诊原因章节-->
                    <component>
                        <section>
                            <code displayName="会诊原因"/>
                            <text/>
                            <!--会诊类型-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.319.00" displayName="会诊类型" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ConsultType"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--会诊原因-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.039.00" displayName="会诊原因" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ConsultReason"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    会诊意见章节
                    ********************************************************
                    -->
                    <!--会诊意见章节-->
                    <component>
                        <section>
                            <code displayName="会诊意见"/>
                            <text/>
                            <!--会诊意见-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.018.00" displayName="会诊意见" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ConsultOpinion"/>
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
                                        <xsl:value-of select="TreatmentDesc"/>
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