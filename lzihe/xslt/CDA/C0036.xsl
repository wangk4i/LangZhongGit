<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0036">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.56"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0036" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>24h内入院死亡记录</title>
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
                    <!-- 现住址 -->
                    <addr use="H">
                        <houseNumber>
                            <xsl:value-of select="LivingAddrInfo/HouseNumber"/>
                        </houseNumber>
                        <streetName>
                            <xsl:value-of select="LivingAddrInfo/StreetName"/>
                        </streetName>
                        <township>
                            <xsl:value-of select="LivingAddrInfo/Township"/>
                        </township>
                        <county>
                            <xsl:value-of select="LivingAddrInfo/County"/>
                        </county>
                        <city>
                            <xsl:value-of select="LivingAddrInfo/City"/>
                        </city>
                        <state>
                            <xsl:value-of select="LivingAddrInfo/State"/>
                        </state>
                    </addr>
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
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <maritalStatusCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="MarriageCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="MarriageName"/>
                            </xsl:attribute>
                        </maritalStatusCode>
                        <ethnicGroupCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationName"/>
                            </xsl:attribute>
                        </ethnicGroupCode>
                        <!-- 年龄 -->
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                        <!--职业状况-->
                        <occupation>
                            <occupationCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="OccupationCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="OccupationName"/>
                                </xsl:attribute>
                            </occupationCode>
                        </occupation>
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
            <!-- 病史陈述者 -->
            <xsl:for-each select="HistoryTellerInfo/row">
                <informant>
                    <assignedEntity>
                        <id/>
                        <!--陈述者与患者的关系代码-->
                        <code code="" displayName="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="RelationshipCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="RelationshipName"/>
                            </xsl:attribute>
                        </code>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </informant>
            </xsl:for-each>
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
            <!-- 最终审核者签名 -->
            <legalAuthenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ChiefDoctorInfo/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ChiefDoctorInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="主任医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="ChiefDoctorInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 接诊医师签名 -->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ReceptionDoctorInfo/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ReceptionDoctorInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="接诊医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="ReceptionDoctorInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!--住院医师签名-->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ResidentDoctorInfo/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ResidentDoctorInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="住院医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="ResidentDoctorInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!--主治医师签名-->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AttendingDoctorInfo/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AttendingDoctorInfo/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="主治医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AttendingDoctorInfo/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
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
                    <effectiveTime>
                        <!-- 入院日期时间 -->
                        <low value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="AdmTimeLow"/>
                            </xsl:attribute>
                        </low>
                        <!-- 出院日期时间 -->
                        <high value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="AdmTimeHigh"/>
                            </xsl:attribute>
                        </high>
                    </effectiveTime>
                </encompassingEncounter>
            </componentOf>
            <!--***************************************************
        文档体Body
        *******************************************************
        -->
            <component>
                <structuredBody>
                    <!--主诉章节-->
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
                    <!--主要健康问题章节 -->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--陈述内容可靠标志-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.143.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="陈述内容可靠标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="StatementReliableSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--中医“四诊”观察结果-->
                            <xsl:for-each select="ChineseObserveDiagResult/ChineseObserveDiagResultItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
        ********************************************************
        入院诊断章节
        ********************************************************
        -->
                    <component>
                        <section>
                            <code code="46241-6" displayName="HOSPITAL ADMISSION DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--入院诊断-西医条目-->
                            <xsl:for-each select="AdmWesternDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--入院诊断-西医诊断编码-代码-->
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-西医诊断编码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表ICD-10">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="DiagName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--入院诊断-中医条目-->
                            <xsl:for-each select="AdmChineseDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医病名名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--入院诊断-中医诊断编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医病名代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="DiagName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--入院诊断-中医证候编码-名称-->
                                                <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医证候名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="TCMsyndromeName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--入院诊断-中医证候编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断-中医证候代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="TCMsyndromeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="TCMsyndromeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--治则治法条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="INT">
                                    <code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="治则治法"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrincipleDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--住院过程章节-->
                    <component>
                        <section>
                            <code code="8648-8" displayName="HOSPITAL COURSE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--入院情况条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.148.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院情况"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AdmCondition"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--诊疗过程描述条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DiagProcessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--死亡日期时间条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.01.036.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡日期时间"/>
                                    <effectiveTime>
                                        <high value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DeathTime"/>
                                            </xsl:attribute>
                                        </high>
                                    </effectiveTime>
                                </observation>
                            </entry>
                            <!--死亡原因条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.099.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡原因"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DeathReason"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--死亡诊断-西医条目-->
                            <xsl:for-each select="DeathWesternDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-西医诊断名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--死亡诊断-西医诊断编码-代码-->
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-西医诊断编码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表ICD-10">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="DiagName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--死亡诊断-中医条目-->
                            <xsl:for-each select="DeathChineseDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医病名名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DiagName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--死亡诊断-中医诊断编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医病名代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="DiagName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--死亡诊断-中医证候编码-名称-->
                                                <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医证候名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="TCMsyndromeName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--死亡诊断-中医证候编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡诊断-中医证候代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="TCMsyndromeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="TCMsyndromeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>