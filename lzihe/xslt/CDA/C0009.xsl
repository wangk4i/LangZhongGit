<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0009">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.29"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0009" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>一般手术记录</title>
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
                    <!--电子申请单编号-->
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
            <!--手术者签名-->
            <authenticator>
                <!--签名日期时间-->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="OperatorSignTime"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OperatorCode"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="手术者"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="OperatorName"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
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
                    <!-- 入院日期时间 -->
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
            <component>
                <structuredBody>
                    <!--既往史章节-->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--手术史-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--手术史标志-->
                                    <code code="DE02.10.062.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PastOperationSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <component>
                        <section>
                            <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术前诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--术前诊断编码-->
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
                        </section>
                    </component>
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="Operation/row">
                                <entry>
                                    <!-- 1..1 手术记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code code="" displayName="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="OperationName"/>
                                            </xsl:attribute>
                                        </code>
                                        <!--操作日期/时间-->
                                        <effectiveTime>
                                            <!--手术开始日期时间-->
                                            <low value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SurgeryTimeLow"/>
                                                </xsl:attribute>
                                            </low>
                                            <!--手术结束日期时间-->
                                            <high value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SurgeryTimeHigh"/>
                                                </xsl:attribute>
                                            </high>
                                        </effectiveTime>
                                        <!--手术者-->
                                        <performer typeCode="PRF">
                                            <assignedEntity>
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="SurgeryUserCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <assignedPerson>
                                                    <name>
                                                        <xsl:value-of select="SurgeryUserName"/>
                                                    </name>
                                                </assignedPerson>
                                            </assignedEntity>
                                        </performer>
                                        <!--第一助手-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="IAssistantCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="Ⅰ助"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="IAssistantName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <!--第二助手-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="IIAssistantCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="Ⅱ助"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="IIAssistantName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <!--器械护士姓名-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="EquipmentNurseCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="器械护士"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="EquipmentNurseName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <!--巡台护士姓名-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="PatrolNurseCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="巡台护士"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="PatrolNurseName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgeryName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术间编号-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgeryRoom"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术级别 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.255.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术级别"/>
                                                <!--手术级别 -->
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.258" codeSystemName="手术级别代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="SurgeryLevelCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="SurgeryLevelName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--失血章节-->
                    <component>
                        <section>
                            <code code="55103-6" displayName="Surgical operation note estimated blood loss" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--出血量（mL）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出血量（mL）"/>
                                    <value xsi:type="PQ" unit="mL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BleedingVolume"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--输血章节-->
                    <component>
                        <section>
                            <code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--输血量（mL）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--输血量（mL）-->
                                    <code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量（mL）"/>
                                    <value xsi:type="PQ" unit="mL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BloodVolume"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--输血反应标志-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--输血反应标志-->
                                    <code code="DE06.00.264.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BloodReactionSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--麻醉章节-->
                    <component>
                        <section>
                            <code code="10213-7" displayName="Surgical operation note anesthesia" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <!-- 麻醉方式代码 -->
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
                                    <value code="" displayName="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AnaesthesiaWayCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="AnaesthesiaWayName"/>
                                        </xsl:attribute>
                                    </value>
                                    <!-- 麻醉医师姓名 -->
                                    <performer>
                                        <assignedEntity>
                                            <id/>
                                            <assignedPerson>
                                                <name>
                                                    <xsl:value-of select="AnaesthesiaDoctors"/>
                                                </name>
                                            </assignedPerson>
                                        </assignedEntity>
                                    </performer>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--用药章节-->
                    <component>
                        <section>
                            <code code="10160-0" displayName="History of medication use" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术前用药-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--术前用药-->
                                    <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前用药">
                                        <qualifier>
                                            <name displayName="术前用 药"/>
                                        </qualifier>
                                    </code>
                                    <xsl:for-each select="PreSurgeryDrugDesc/PreSurgeryDrugDescItem">
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </xsl:for-each>
                                </observation>
                            </entry>
                            <!--术中用药-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--术中用药-->
                                    <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中用药">
                                        <qualifier>
                                            <name displayName="术中用 药"/>
                                        </qualifier>
                                    </code>
                                    <xsl:for-each select="InSurgeryDrugDesc/InSurgeryDrugDescItem">
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </xsl:for-each>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--输液章节-->
                    <component>
                        <section>
                            <code code="10216-0" displayName="Surgical operation note fluids" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--输液量（mL）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--输液量（mL）-->
                                    <code code="DE06.00.268.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输液量（mL）"/>
                                    <value xsi:type="PQ" unit="mL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="InfusionVolume"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--术后诊断章节-->
                    <component>
                        <section>
                            <code code="10218-6" displayName="Surgical operation note postoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术后诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--术后诊断编码-->
                                    <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="AfterDiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--手术过程描述章节-->
                    <component>
                        <section>
                            <code code="8724-7" displayName="Surgical operation note description" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <!--手术过程描述-->
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术过程描述"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SurgeryDesc"/>
                                    </value>
                                    <!--手术目标部位名称 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="SurgeryPartDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--介入物名称 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.037.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="介入物名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="InterventionName"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--手术体位代码 -->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.260.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术体位代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.262" codeSystemName="手术体位代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="SurgeryPositionCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="SurgeryPositionName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--皮肤消毒描述-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.057.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤消毒描述"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="SkinDisinfectionDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--手术切口描述-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.321.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口描述"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="IncisionDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--引流标志-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流标志"/>
                                            <value xsi:type="BL" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DrainageSign"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--引流章节-->
                    <component>
                        <section>
                            <code code="11537-8" displayName="Surgical drains" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--引流标志-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--引流标志-->
                                    <code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流标志"/>
                                    <value xsi:type="BL" value="false"/>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流材料名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="DrainageMaterial"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.045.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="引流材料数目"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="DrainageMaterialNumber"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.341.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="放置部位"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="DrainagePlace"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>