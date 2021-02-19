<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0023">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <!-- 文档信息模型类别-标识符 HL7注册模型的编码系统OID -->
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <!-- 文档模板的根OID -->
            <templateId root="2.16.156.10011.2.1.1.43"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <!-- 中国卫生信息开放系统互连对象标识OID分配表 表D.4 固定对象OID分配 2.16.156.10011.2.4-->
            <code code="C0023" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <!--修改title-->
            <title>入院评估</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <!-- 文档密级 表C.3 ClinicalDocument.confidentialityCode值域表 (CWE) -->
            <confidentialityCode code="N" displayName="正常访问保密级别" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality"/>
            <!-- 文档语言 表达文档采用的语言 代码值取HL7内部编码系统codeSystem ="2.16.840.1.113883.6.121". 人类语言编码系统 -->
            <languageCode code="zh-CN"/>
            <!--文档集-标识符 该属性用于维护一份连续更新的文档，创建一个统一的文档集合标识符 -->
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <!--文档记录对象 用于表达此文档的患者信息 -->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!-- DE01.00.021.00健康卡号-->
                    <id root="2.16.156.10011.1.19" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HealthCardCode"/>
                        </xsl:attribute>
                    </id>
                    <!-- 住院号标识 表F.2 可维护对象OID分配表-->
                    <!-- HDSD00.09.085 DE01.00.014.00 住院号-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!-- HDSD00.09.027 DE02.01.010.00 患者电话号码 -->
                    <!-- 移动电话 -->
                    <xsl:for-each select="TelComMP/TelComMPItem">
                        <telecom use="MP" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    <!--HDSD00.09.013 DE02.01.010.00< 工作单位电话号码-->
                    <xsl:for-each select="TelComWP/TelComWPItem">
                        <telecom use="WP" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    <!-- HDSD00.09.028 DE02.01.012.00 患者电子邮件地址 -->
                    <xsl:for-each select="TelComEM/TelComEMItem">
                        <telecom use="EM" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </telecom>
                    </xsl:for-each>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!-- DE02.01.030.00患者的身份证件上的唯一法定标识符 -->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <!-- HDSD00.09.029 DE02.01.039.00 患者姓名 -->
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <!-- 表G.4 用到的国标级数据元值域代码OID分配表-->
                        <!-- HDSD00.09.071 DE02.01.040.00 性别代码 -->
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!-- HDSD00.09.030 DE02.01.018.00 婚姻状况代码 -->
                        <maritalStatusCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="MarriageCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="MarriageValue"/>
                            </xsl:attribute>
                        </maritalStatusCode>
                        <!-- HDSD00.09.041 DE02.01.025.00 民族 -->
                        <ethnicGroupCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationValue"/>
                            </xsl:attribute>
                        </ethnicGroupCode>
                        <!-- 国籍 -->
                        <nationality code="" codeSystem="2.16.156.10011.2.3.3.1" codeSystemName="世界各国和地区名称代码(GB/T 2659)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationalityCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationalityName"/>
                            </xsl:attribute>
                        </nationality>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                        <!--HDSD00.09.073 DE02.01.041.00 学历代码 -->
                        <educationLevel>
                            <educationLevelCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.6" codeSystemName="学历代码表(GB/T 4658)">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="EducationCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="EducationName"/>
                                </xsl:attribute>
                            </educationLevelCode>
                        </educationLevel>
                        <!--HDSD00.09.083 DE02.01.052.00 职业类别代码 -->
                        <occupation>
                            <occupationCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="EmployerTypeCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="EmployerTypeName"/>
                                </xsl:attribute>
                            </occupationCode>
                        </occupation>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <!-- 填表日期 -->
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
                    <!-- 访视医生姓名 -->
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!--文档管理者 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <!--医疗卫生服务机构标识 OID 表D.2 可维护对象OID分配表 -->
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
            <!--法定审核者 表达对文档直接起到法律效应的法定审核者信息 -->
            <legalAuthenticator typeCode="LA">
                <!--HDSD00.09.047 DE09.00.053.00 签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ChargeNurseSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <!--医务人员标识 OID 表D.2 可维护对象OID分配表 -->
                    <!--HDSD00.09.082 DE02.01.039.00 责任护士签名 -->
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ChargeNurseCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="责任护士"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="ChargeNurseName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!--文档审核者 该部分信息表达文档经过了一定的审核，但还没达到一定的法律效应 -->
            <authenticator>
                <!--HDSD00.09.047 DE09.00.053.00 签名日期时间 -->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ReceptionNurseSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity classCode="ASSIGNED">
                    <!--医务人员标示 OID 表F.2 可维护对象OID分配表 -->
                    <!--HDSD00.09.034 DE02.01.039.00 接诊护士签名 -->
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ReceptionNurseCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="接诊护士"/>
                    <assignedPerson classCode="PSN">
                        <name>
                            <xsl:value-of select="ReceptionNurseName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <participant typeCode="NOT">
                <!--联系人@classCode：CON，固定值，表示角色是联系人 -->
                <associatedEntity classCode="ECON">
                    <code/>
                    <!--HDSD00.09.038 DE02.01.010.00 联系人电话号码 -->
                    <telecom value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="ContactsTelPhone"/>
                        </xsl:attribute>
                    </telecom>
                    <!--联系人-->
                    <associatedPerson>
                        <!--HDSD00.09.039 DE02.01.039.00 联系人姓名 -->
                        <xsl:for-each select="ContactsName/ContactsNameItem">
                            <name>
                                <xsl:value-of select="."/>
                            </name>
                        </xsl:for-each>
                    </associatedPerson>
                </associatedEntity>
            </participant>
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
            <componentOf typeCode="COMP">
                <!--就诊 -->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <code/>
                    <effectiveTime nullFlavor="NI"/>
                    <location typeCode="LOC">
                        <healthCareFacility classCode="SDLOC">
                            <!--机构角色 -->
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
                                                <!--HDSD00.09.005 DE08.10.054.00 病区名称 -->
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
                                                        <!--HDSD00.09.036 DE08.10.026.00 科室名称-->
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
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <!-- 医疗卫生服务机构标识表F.2 可维护对象OID分配表-->
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
            <component>
                <structuredBody>
                    <!--入院信息章节-->
                    <component>
                        <section>
                            <code displayName="入院信息"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--HDSD00.09.053 DE05.10.053.00 入院原因 -->
                                    <code code="DE05.10.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院原因"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AdmissionReasonDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--HDSD00.09.052 DE06.00.339.00 入院途径代码 -->
                                    <code code="DE06.00.339.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院途径代码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.270" codeSystemName="入院途径代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AdmissionWayCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AdmissionWayName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.237.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入病房方式"/>
                                    <!--HDSD00.09.050 DE06.00.237.00 入病房方式 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="InRoomModeDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--症状章节 补充LOINC代码-->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="MainSymptomDesc/MainSymptomDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.01.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主要症状名称"/>
                                        <!--HDSD00.09.084 DE04.01.117.00 主要症状名称 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--生命体征章节-->
                    <component>
                        <section>
                            <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温(℃)"/>
                                    <!-- HDSD00.09.063 DE04.10.186.00 体温（℃）-->
                                    <value xsi:type="PQ" value="36" unit="℃">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientTemperature"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率"/>
                                    <!-- HDSD00.09.040 DE04.10.118.00 脉率（次/min）-->
                                    <value xsi:type="PQ" value="70" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientPulse"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率"/>
                                    <!-- HDSD00.09.016 DE04.10.081.00 呼吸频率（次/min）-->
                                    <value xsi:type="PQ" value="83" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientBreath"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
                                            <!-- HDSD00.09.056 DE04.10.174.00 收缩压（mmHg）-->
                                            <value xsi:type="PQ" value="120" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PatientSystolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                            <!-- HDSD00.09.058 DE04.10.176.00 舒张压（mmHg）-->
                                            <value xsi:type="PQ" value="60" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PatientDiastolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重"/>
                                    <!-- HDSD00.09.064 DE04.10.188.00 体重（kg）-->
                                    <value xsi:type="PQ" value="0.00" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--既往史章节-->
                    <component>
                        <section>
                            <code code="11348-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF PAST ILLNESS"/>
                            <text/>
                            <xsl:for-each select="HoD/HoDItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病史(含外伤)"/>
                                        <!--HDSD00.09.031 DE02.10.026.00 疾病史（含外伤）-->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="HoID/HoIDItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.008.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="传染病史"/>
                                        <!--HDSD00.09.009 DE02.10.008.00 传染病史 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="HoI/HoIItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.101.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="预防接种史"/>
                                        <!--HDSD00.09.081 DE02.10.101.00 预防接种史 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="HoS/HoSItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史"/>
                                        <!--HDSD00.09.057 DE02.10.061.00 手术史 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="HoT/HoTItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.100.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血史"/>
                                        <!--HDSD00.09.059 DE02.10.100.00 输血史 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般健康状况标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="HealthySign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者传染性标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="InfectivitySign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--过敏史章节-->
                    <component>
                        <section>
                            <!--code code="10155-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF ALLERGIES"/-->
                            <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="HoA/HoAItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <!--HDSD00.09.015 DE02.10.022.00 过敏史 -->
                                        <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--家族史章节-->
                    <component>
                        <section>
                            <code code="10157-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF FAMILY MEMBER DISEASES"/>
                            <text/>
                            <xsl:for-each select="HoF/HoFItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="家族史"/>
                                        <!--HDSD00.09.033 DE02.10.103.00 家族史 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="HoF"/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--健康评估章节-->
                    <component>
                        <section>
                            <code code="51848-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Assessment note"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Apgar评分值"/>
                                    <!--HDSD00.09.001 DE05.10.001.00 Apgar评分值-->
                                    <value xsi:type="INT" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ApgarScore"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="发育程度代码"/>
                                    <!--HDSD00.09.011 DE05.10.022.00 发育程度代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.53" codeSystemName="发育程度代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DevelopmentDegreeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DevelopmentDegreeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.142.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="精神状态正常标志"/>
                                    <!--HDSD00.09.035 DE05.10.142.00 精神状态正常标志 -->
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="MentalitySign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.065.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="睡眠状况"/>
                                    <!--HDSD00.09.060 DE05.10.065.00 睡眠状况 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SleepingDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.158.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊情况"/>
                                    <!--HDSD00.09.061 DE05.10.158.00 特殊情况 -->
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SpecialEventDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.084.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心理状态代码"/>
                                    <!--HDSD00.09.070 DE05.10.084.00 心理状态代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.140" codeSystemName="心理状态代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PsychologyCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PsychologyName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="营养状态代码"/>
                                    <!--HDSD00.09.079 DE05.10.097.00 营养状态代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.54" codeSystemName="营养状态代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="NutritionCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NutritionName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.122.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="自理能力代码"/>
                                    <!--HDSD00.09.086 DE05.10.122.00 自理能力代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.55" codeSystemName="自理能力代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="SelfCareCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="SelfCareName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--生活方式章节-->
                    <component>
                        <section>
                            <code displayName="生活方式"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="吸烟标志"/>
                                    <!--HDSD00.09.068 DE03.00.070.00 吸烟标志-->
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SmokeSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="吸烟状况代码"/>
                                    <!--HDSD00.09.069 DE03.00.073.00 吸烟状况代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.5" codeSystemName="吸烟状况代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="SmokeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="SmokeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="日吸烟量(支)"/>
                                    <!--HDSD00.09.048 DE03.00.053.00 日吸烟量（支）-->
                                    <value xsi:type="PQ" value="" unit="支">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SmokeVolume"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.065.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="停止吸烟天数"/>
                                    <!--HDSD00.09.065 DE03.00.065.00 停止吸烟天数 -->
                                    <value xsi:type="PQ" value="" unit="d">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SmokeStopDays"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.030.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮酒标志"/>
                                    <!--HDSD00.09.075 DE03.00.030.00 饮酒标志 -->
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DrinkSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.076.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮酒频率代码"/>
                                    <!--HDSD00.09.076 DE03.00.076.00 饮酒频率代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.16" codeSystemName="饮酒频率代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DrinkRateCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DrinkRateName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.054.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="日饮酒量（mL）"/>
                                    <!--HDSD00.09.049 DE03.00.054.00 日饮酒量（mL）-->
                                    <value xsi:type="PQ" value="" unit="mL">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DrinkVolume"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食情况代码"/>
                                    <!--HDSD00.09.077 DE03.00.080.00 饮食情况代码 -->
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DietCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DietName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--入院诊断章节-->
                    <component>
                        <section>
                            <code code="46241-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL ADMISSION DX"/>
                            <text/>
                            <xsl:for-each select="HospitalizeDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断编码"/>
                                        <!--HDSD00.09.054 DE05.01.024.00 入院诊断编码 -->
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="HospitalizeDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="HospitalizeDiagName"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--护理观察章节-->
                    <component>
                        <section>
                            <code displayName="护理观察"/>
                            <text/>
                            <xsl:for-each select="NursingObservationInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
                                        <!--HDSD00.09.022 DE02.10.031.00 护理观察项目名称 -->
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NursingObservationItemName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
                                                <!--HDSD00.09.021 DE02.10.028.00 护理观察结果 -->
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="NursingObservationResult"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 住院过程章节 -->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
                            <text/>
                            <!-- 通知医师情况 -->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.280.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="通知医师标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AdviseDoctorSign"/>
                                        </xsl:attribute>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.279.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="通知医师日期时间"/>
                                            <value xsi:type="TS" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AdviseDoctorTime"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!-- 评估日期时间 -->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.144.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="评估日期时间"/>
                                    <value xsi:type="TS" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AssessmentTime"/>
                                        </xsl:attribute>
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