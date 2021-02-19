<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0018">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.38"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0018" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>病危（重）护理记录</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <!--N-->
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <!--N:全部改为zh-CN，OK-->
            <languageCode code="zh-CN"/>
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--住院号：DE01.00.014.00 @@@参照OID分配表修改 -->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
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
                        <!--N:有就填-->
                        <age value="" unit="岁">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <providerOrganization>
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ProviderOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="ProviderOrgName"/>
                        </name>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!-- 文档作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <!--签名日期时间：DE09.00.053.00-->
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
                    <code displayName="护士"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 文档生成机构 -->
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
            <xsl:for-each select="AuthenticatorInfo/row">
                <authenticator>
                    <!--签名日期时间：DE09.00.053.00 -->
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
                        <code displayName="护士"/>
                        <assignedPerson>
                            <!--姓名-->
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
            <!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
            <componentOf typeCode="COMP">
                <!--就诊-->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <code/>
                    <effectiveTime nullFlavor="NI"/>
                    <location typeCode="LOC">
                        <healthCareFacility classCode="SDLOC">
                            <!--机构角色-->
                            <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                <asOrganizationPartOf classCode="PART">
                                    <!--病床号：DE01.00.026.00-->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <!--N:加上OID-->
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!--病房号：DE01.00.019.00-->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <!--N:加上OID-->
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!--病区名称：DE08.10.054.00-->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <!--N:加上OID-->
                                                        <id root="2.16.156.10011.1.27" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="AreaCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="AreaName"/>
                                                        </name>
                                                        <!--科室名称：DE08.10.026.00-->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <!--N:加上OID-->
                                                                <id root="2.16.156.10011.1.26" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="DeptCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="DeptName"/>
                                                                </name>
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
                    <!-- 过敏史章节 -->
                    <component>
                        <section>
                            <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="AllergiesInfo/row">
                                <entry typeCode="DRIV">
                                    <act classCode="ACT" moodCode="EVN">
                                        <code/>
                                        <entryRelationship typeCode="SUBJ">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史标志"/>
                                                <value xsi:type="BL" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="AllergiesSign"/>
                                                    </xsl:attribute>
                                                </value>
                                                <participant typeCode="CSM">
                                                    <participantRole classCode="MANU">
                                                        <playingEntity classCode="MMAT">
                                                            <!--过敏史描述-->
                                                            <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                                            <desc xsi:type="ST">
                                                                <xsl:value-of select="AllergiesDesc"/>
                                                            </desc>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                            </observation>
                                        </entryRelationship>
                                    </act>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--生命体征章节-->
                    <component>
                        <section>
                            <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温（℃）"/>
                                    <value xsi:type="PQ" value="" unit="℃">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientTemperature"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率（次/min）"/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="HeartRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min）"/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BreathRate"/>
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
                                            <value xsi:type="PQ" value="" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SystolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                            <value xsi:type="PQ" value="" unit="mmHg">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DiastolicPressure"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血糖检测值（mmol/L）"/>
                                    <value xsi:type="PQ" value="" unit="mmol/L">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BloodGlucoseValue"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--健康评估章节-->
                    <component>
                        <section>
                            <code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE03.00.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="饮食情况代码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码">
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
                    <!--护理记录章节-->
                    <component>
                        <section>
                            <code displayName="护理记录"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.211.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理等级代码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.259" codeSystemName="护理等级代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="NursingGradeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NursingGradeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.212.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理类型代码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.260" codeSystemName="护理类型代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="NursingTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NursingTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--护理观察章节-->
                    <component>
                        <section>
                            <code displayName="护理观察"/>
                            <text/>
                            <!--多个观察写多个entry即可，每个观察对应着观察结果描述-->
                            <xsl:for-each select="NursingObserveInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NursingObserveItemName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="NursingObserveResult"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--护理操作章节：一个护理操作对应多个操作项目类目，一个操作项目类目又对应多个操作结果-->
                    <xsl:for-each select="NursingOperateInfo/row">
                        <component>
                            <section>
                                <code displayName="护理操作"/>
                                <text/>
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NursingOperateName"/>
                                        </value>
                                        <xsl:for-each select="NursingOperationItemInfo/row">
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
                                                    <value xsi:type="ST">
                                                        <xsl:value-of select="NursingOperationItemName"/>
                                                    </value>
                                                    <xsl:for-each select="NursingOperateResult/NursingOperateResultItem">
                                                        <entryRelationship typeCode="COMP">
                                                            <observation classCode="OBS" moodCode="EVN">
                                                                <code code="DE06.00.209.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作结果"/>
                                                                <value xsi:type="ST">
                                                                    <xsl:value-of select="."/>
                                                                </value>
                                                            </observation>
                                                        </entryRelationship>
                                                    </xsl:for-each>
                                                </observation>
                                            </entryRelationship>
                                        </xsl:for-each>
                                    </observation>
                                </entry>
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.207.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸机监护项目"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="VentilatorMonitorItem"/>
                                        </value>
                                    </observation>
                                </entry>
                            </section>
                        </component>
                    </xsl:for-each>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>