<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0019">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.39"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0019" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>手术护理记录</title>
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
                    <!--门（急）诊号标识 -->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
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
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
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
                    <code displayName="巡台护士"/>
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
            <xsl:for-each select="PatrolNurseInfo/row">
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
                        <code displayName="巡台护士"/>
                        <assignedPerson>
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="EquipmentNurseInfo/row">
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
                        <code displayName="器械护士"/>
                        <assignedPerson>
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="HandoverNurseInfo/row">
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
                        <code displayName="交接护士"/>
                        <assignedPerson>
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <xsl:for-each select="TransporterInfo/row">
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
                        <code displayName="转运者"/>
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
                    <!--术前诊断章节-->
                    <component>
                        <section>
                            <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="PreDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="PreDiagCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="PreDiagName"/>
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
                            <xsl:for-each select="PatientWeight/PatientWeightItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重（kg）"/>
                                        <value xsi:type="PQ" value="" unit="kg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 实验室检查章节-->
                    <component>
                        <section>
                            <code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="STUDIES SUMMARY"/>
                            <text/>
                            <entry>
                                <!-- 血型-->
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <!-- ABO血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientABOCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PatientABODescribe"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <!-- Rh(d)血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientRHCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PatientRHDescribe"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--皮肤章节-->
                    <component>
                        <section>
                            <code code="29302-7" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="INTEGUMENTARY SYSTEM"/>
                            <text/>
                            <xsl:for-each select="SkinCheackDesc/SkinCheackDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.126.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤检查描述"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
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
                    <!--器械物品核对章节-->
                    <component>
                        <section>
                            <code displayName="术前器械物品核对"/>
                            <text/>
                            <!--术前-->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <code/>
                                    <statusCode code="completed"/>
                                    <!--巡台护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PrePatrolNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PrePatrolNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="巡台护士"/>
                                            <!--巡台护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="PrePatrolNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <!--器械护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PreEquipmentNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PreEquipmentNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="器械护士"/>
                                            <!--器械护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="PreEquipmentNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="PreSurgeryEquipmentName"/>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE09.00.111.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前清点标志"/>
                                                    <value xsi:type="BL" value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PreInventorySign"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--关前核对-->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <code/>
                                    <statusCode/>
                                    <!--巡台护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="InPatrolNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="InPatrolNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="巡台护士"/>
                                            <!--巡台护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="InPatrolNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <!--器械护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="InEquipmentNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="InEquipmentNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="器械护士"/>
                                            <!--器械护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="InEquipmentNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="InSurgeryEquipmentName"/>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="关前核对标志"/>
                                                    <value xsi:type="BL" value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="InInventorySign"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--关后核对-->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <code/>
                                    <statusCode code="completed"/>
                                    <!--巡台护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PostPatrolNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PostPatrolNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="巡台护士"/>
                                            <!--巡台护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="PostPatrolNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <!--器械护士-->
                                    <participant typeCode="ATND">
                                        <!--签名日期时间：DE09.00.053.00-->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PostEquipmentNurseInfo/Time"/>
                                            </xsl:attribute>
                                        </time>
                                        <participantRole classCode="ASSIGNED">
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PostEquipmentNurseInfo/Code"/>
                                                </xsl:attribute>
                                            </id>
                                            <!--角色-->
                                            <code displayName="器械护士"/>
                                            <!--器械护士签名：DE02.01.039.00-->
                                            <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                <name>
                                                    <xsl:value-of select="PostEquipmentNurseInfo/Name"/>
                                                </name>
                                            </playingEntity>
                                        </participantRole>
                                    </participant>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中所用物品名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="PostSurgeryEquipmentName"/>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="DE06.00.204.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="关后核对标志"/>
                                                    <value xsi:type="BL" value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PostInventorySign"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--手术操作章节-->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OperationInfo/row">
                                <entry>
                                    <!-- 1..1 手术记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <!--手术及操作编码:DE06.00.093.00-->
                                        <code code="" displayName="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="OperationName"/>
                                            </xsl:attribute>
                                        </code>
                                        <statusCode/>
                                        <!--手术时间：开始日期时间DE06.00.218.00、结束日期时间DE06.00.221.00-->
                                        <effectiveTime>
                                            <low value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SurgeryTimeLow"/>
                                                </xsl:attribute>
                                            </low>
                                            <high value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SurgeryTimeHigh"/>
                                                </xsl:attribute>
                                            </high>
                                        </effectiveTime>
                                        <!--手术目标部位名称：DE06.00.187.00-->
                                        <targetSiteCode code="" displayName="" codeSystem="2.16.156.10011.2.3.1.266" codeSystemName="手术目标部位编码">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="SurgeryParCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="SurgeryPartName"/>
                                            </xsl:attribute>
                                        </targetSiteCode>
                                        <!--手术操作者：DE02.01.039.00-->
                                        <performer>
                                            <assignedEntity>
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DoctorCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="手术操作者"/>
                                                <assignedPerson>
                                                    <name>
                                                        <xsl:value-of select="DoctorName"/>
                                                    </name>
                                                </assignedPerson>
                                            </assignedEntity>
                                        </performer>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.060.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中病理标志"/>
                                                <value xsi:type="BL" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="InSurgeryPathologySign"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.317.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="准备事项"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgeryPlanDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术间编号"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgeryRoom"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!-- 出入手术室时间 -->
                                        <entryRelationship typeCode="COMP">
                                            <organizer classCode="BATTERY" moodCode="EVN">
                                                <statusCode/>
                                                <!-- DE06.00.236.00入手术室日期时间 DE06.00.191.00 出手术室日期时间 -->
                                                <effectiveTime>
                                                    <low value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="InSurgeryRoomTime"/>
                                                        </xsl:attribute>
                                                    </low>
                                                    <high value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OutSurgeryRoomTime"/>
                                                        </xsl:attribute>
                                                    </high>
                                                </effectiveTime>
                                            </organizer>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--住院过程章节 术后交接-->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
                            <title>住院过程章节</title>
                            <xsl:for-each select="HandoverInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病人交接核对项目"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="HandoverItem"/>
                                        </value>
                                        <!--交接护士-->
                                        <author>
                                            <!--交接日期时间：DE09.00.107.00-->
                                            <time value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PostHandoverNurseSignTime"/>
                                                </xsl:attribute>
                                            </time>
                                            <assignedAuthor>
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="PostHandoverNurseCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="交接护士"/>
                                                <!--交接护士签名：DE02.01.039.00-->
                                                <assignedPerson>
                                                    <name>
                                                        <xsl:value-of select="PostHandoverNurseName"/>
                                                    </name>
                                                </assignedPerson>
                                            </assignedAuthor>
                                        </author>
                                        <!--转运者-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="PostTransporterCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <!--角色-->
                                                <code displayName="转运者"/>
                                                <!--转运者签名：DE02.01.039.00-->
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="PostTransporterName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
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