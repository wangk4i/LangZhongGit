<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0021">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 file:///C:/Users/Administrator/Desktop/POCD_MT000040.xsd">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.41"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0021" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>出入量记录</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <!--N-->
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <!--N:全部改为zh-CN，ＯＫ-->
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
                                <xsl:value-of select="HospitalizationOrganCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="HospitalizationOrganName"/>
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
            <xsl:for-each select="NurseSignInfo/row">
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
            <!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
            <componentOf typeCode="COMP">
                <!--就诊-->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <code/>
                    <effectiveTime/>
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
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="DiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
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
                                            <xsl:value-of select="NursingLevelCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="NursingLevelName"/>
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
                            <xsl:for-each select="NursingObservationInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NursingObservationItemName"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
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
                    <!--护理操作章节：一个护理操作对应多个操作项目类目，一个操作项目类目又对应多个操作结果-->
                    <component>
                        <section>
                            <code displayName="护理操作"/>
                            <text/>
                            <xsl:for-each select="NursingOperationInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.342.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NursingOperationName"/>
                                        </value>
                                        <xsl:for-each select="NursingOperationItemInfo/row">
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE06.00.210.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理操作项目类目名称"/>
                                                    <value xsi:type="ST">
                                                        <xsl:value-of select="NursingOperationItemName"/>
                                                    </value>
                                                    <xsl:for-each select="NursingOperationResult/NursingOperationResultItem">
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
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--用药章节 -->
                    <component>
                        <section>
                            <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="MedicationUsecInfo/row">
                                <entry>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <text/>
                                        <!--药物使用途径代码：DE06.00.134.00-->
                                        <routeCode code="" displayName="" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="MedicationUseCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="MedicationUseName"/>
                                            </xsl:attribute>
                                        </routeCode>
                                        <!--用药剂量-单次 -->
                                        <doseQuantity value="" unit="mg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="MedicationDosage"/>
                                            </xsl:attribute>
                                        </doseQuantity>
                                        <!--用药频率-->
                                        <rateQuantity>
                                            <translation code="" displayName="bid">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="MedicationFrequency"/>
                                                </xsl:attribute>
                                            </translation>
                                        </rateQuantity>
                                        <consumable>
                                            <manufacturedProduct>
                                                <manufacturedLabeledDrug>
                                                    <!--药品名称 -->
                                                    <code/>
                                                    <name>
                                                        <xsl:value-of select="DrugName"/>
                                                    </name>
                                                </manufacturedLabeledDrug>
                                            </manufacturedProduct>
                                        </consumable>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物用法"/>
                                                <!--药物用法描述-->
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugUseDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.164.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中药使用类别代码"/>
                                                <!--中药使用类别代码-->
                                                <value code="" displayName="" codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表" xsi:type="CD">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseDurgTypeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ChineseDurgTypeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
                                                <!--药物使用总剂量-->
                                                <value xsi:type="PQ" value="" unit="mg">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DrugTotalDose"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </substanceAdministration>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--护理标志章节-->
                    <component>
                        <section>
                            <code displayName="护理标志"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.048.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呕吐标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="VomitSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.051.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="排尿困难标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DysuriaSign"/>
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