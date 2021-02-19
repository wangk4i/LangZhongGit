<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0013">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.33"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0013" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>输血记录</title>
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
                    <!--门诊号标识-->
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
                    <id root="2.16.156.10011.1.24" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ApplyID"/>
                        </xsl:attribute>
                    </id>
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
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!-- 年龄 -->
                        <age value="" unit="岁">
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
            <!--医师签名-->
            <xsl:for-each select="ExecutionUserInfo/row">
                <authenticator>
                    <!--签名日期时间-->
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
                        <code displayName="医师"/>
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
                    <!--
********************************************************
实验室检查章节
********************************************************
-->
                    <component>
                        <section>
                            <code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP">
                                <!-- 血型-->
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component typeCode="COMP" contextConductionInd="true">
                                        <!-- ABO血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
                                            <value xsi:type="CD" code="1" displayName="A型" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ABOBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ABOBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component typeCode="COMP" contextConductionInd="true">
                                        <!-- Rh血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
                                            <value xsi:type="CD" code="2" displayName="阳性" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="RHBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="RHBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--
********************************************************
主要健康问题章节
********************************************************
-->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--疾病诊断-->
                            <xsl:for-each select="DiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <!--疾病诊断编码-->
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
                                        <value xsi:type="CD" code="B95.100" displayName="B族链球菌感染" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="DiagName"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--输血章节-->
                    <component>
                        <section>
                            <code code="56836-0" codeSystem="2.16.840.1.113883.6.1" displayName="History of blood transfusion" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <procedure classCode="PROC" moodCode="EVN">
                                    <!--输血日期时间 -->
                                    <effectiveTime>
                                        <high value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTime"/>
                                            </xsl:attribute>
                                        </high>
                                    </effectiveTime>
                                    <entryRelationship typeCode="COMP">
                                        <!-- 输血史标识代码 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.106.00" displayName="输血史标识代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.42" codeSystemName="输血史标识代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="BloodHistoryCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="BloodHistoryName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <!-- 输血性质代码 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血性质代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.43" codeSystemName="输血性质代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="BloodTransfusionNatureCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="BloodTransfusionNatureNane"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <!-- 申请 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="申请ABO血型代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ApplyABOBloodCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ApplyABOBloodName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <!-- 申请Rh血型代码 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="申请Rh（D）血型代码"/>
                                            <value code="2" xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.250" displayName="阳性" codeSystemName="Rh(D)血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ApplyRhBloodCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ApplyRhBloodName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!-- 输血指征 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血指征"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="BloodIndicationsDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!-- 输血过程记录 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血过程记录"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="BloodProcessDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血品种代码 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.040.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血品种代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="BloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="BloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!-- 血袋编码 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE01.00.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血袋编码"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BloodBagCode"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血量（mL） -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量（mL）"/>
                                            <value xsi:type="PQ" value="" unit="mL">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BloodVolume"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血量计量单位 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.036.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量计量单位"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="BloodUnit"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血反应标志 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.264.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应标志"/>
                                            <value xsi:type="BL" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BloodReactionSign"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--输血反应类型 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.265.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应类型"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.252" codeSystemName="输血反应类型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="BloodReactionCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="BloodReactionName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!-- 输血次数 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.263.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血次数"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BloodTimes"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!-- 输血原因 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.107.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血原因"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="BloodReason"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </procedure>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>