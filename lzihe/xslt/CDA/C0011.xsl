<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0011">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.31"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0011" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>麻醉记录</title>
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
            <!--麻醉医师签名-->
            <xsl:for-each select="AnesthetistInfo/row">
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
                        <code displayName="麻醉医师"/>
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
                    <!-- 入院日期时间 -->
                    <effectiveTime value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="HospitalizationTime"/>
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
                            <entry>
                                <!-- 血型-->
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component typeCode="COMP">
                                        <!-- ABO血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ABOBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ABOBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component typeCode="COMP">
                                        <!-- Rh血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表">
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
                    术前诊断章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术前诊断-->
                            <xsl:for-each select="PreDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <!--术前诊断编码-->
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="Code"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="Name"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    术后诊断章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="10218-6" displayName="Surgical operation note postoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术后诊断-->
                            <xsl:for-each select="AfterDiagInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <!--术后诊断编码-->
                                        <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="Code"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="Name"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--用药管理章节 1..*-->
                    <component>
                        <section>
                            <code code="18610-6" displayName="MEDICATION ADMINISTERED" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="DrugUseInfo/row">
                                <entry>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <text/>
                                        <!--药物使用途径代码 -->
                                        <routeCode code="" displayName="" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DrugUseWayCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="DrugUseWayName"/>
                                            </xsl:attribute>
                                        </routeCode>
                                        <!--药物使用次剂量 -->
                                        <doseQuantity value="20.00" unit="mg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DrugDose"/>
                                            </xsl:attribute>
                                        </doseQuantity>
                                        <consumable>
                                            <manufacturedProduct>
                                                <manufacturedLabeledDrug>
                                                    <!--药品代码及名称(通用名) -->
                                                    <code>
                                                        <xsl:value-of select="DrugCode"/>
                                                    </code>
                                                    <name>
                                                        <xsl:value-of select="DrugName"/>
                                                    </name>
                                                </manufacturedLabeledDrug>
                                            </manufacturedProduct>
                                        </consumable>
                                        <!--药物用法 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物用法"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugUsage"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--药物使用频率 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.133.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用频率"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.267" codeSystemName="药物使用频次代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DrugFrequencyCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="DrugFrequencyName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--药物使用剂量单位 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE08.50.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用剂量单位"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugUnit"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--药物使用总剂量 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
                                                <value xsi:type="PQ" value="" unit="g">
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
                    <!--
                    ********************************************************
                    输液章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="10216-0" displayName="Surgical operation note fluids" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术中输液项目 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.269.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术中输液项目"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="InfusionDesc"/>
                                    </value>
                                </observation>
                            </entry>
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
                                </procedure>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    麻醉章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="59774-0" displayName="Procedure anesthesia" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="AnaesthesiaInfo/row">
                                <entry>
                                    <!-- 1..1 麻醉记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <!--麻醉方法代码-->
                                        <code code="" displayName="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="AnaesthesiaWayCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="AnaesthesiaWayName"/>
                                            </xsl:attribute>
                                        </code>
                                        <effectiveTime>
                                            <!--麻醉开始日期时间-->
                                            <low value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AnaesthesiaTimeLow"/>
                                                </xsl:attribute>
                                            </low>
                                        </effectiveTime>
                                        <!--ASA分级标准代码 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.129.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="ASA分级标准代码"/>
                                                <value xsi:type="CD" code="1" displayName="I" codeSystem="2.16.156.10011.2.3.1.255" codeSystemName="美国麻醉医师协会(ASA)分级标准代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ASALevelCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ASALevelName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--气管插管分类 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.228.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="气管插管分类"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="TrachealCannulaDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉药物名称 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉药物名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthetistDrugName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉体位 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.10.260.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉体位"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthetistPositionDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--呼吸类型代码 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.208.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸类型代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.1" codeSystemName="呼吸类型代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="BreathTypeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="BreathTypeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉描述 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.226.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉描述"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnaesthesiaDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉合并症标志代码 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.077.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉合并症标志代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.2.59" codeSystemName="麻醉合并症标志代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AnaesthesiaComplicationCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="AnaesthesiaComplicationName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--穿刺过程 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="穿刺过程"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="PuncutreProcess"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉效果 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.253.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉效果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnaesthesiaResult"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--麻醉前用药 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉前用药"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="PreAnaesthesiaDrug"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
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
                            <xsl:for-each select="RoutineMonitorInfo/row">
                                <entry>
                                    <!--常规监测项目名称 -->
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.216.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="常规监测项目名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="Name"/>
                                        </value>
                                        <!--常规监测项目结果 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.281.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="常规监测项目结果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="Result"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="SpecialMonitorInfo/row">
                                <entry>
                                    <!--特殊监测项目名称 -->
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.216.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊监测项目名称"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="Name"/>
                                        </value>
                                        <!--特殊监测项目结果 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.281.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="特殊监测项目结果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="Result"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
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
                            <!-- 体重 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重"/>
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="PatientTemperature/PatientTemperatureItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温"/>
                                        <value xsi:type="PQ" value="" unit="℃">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率"/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientPulse"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <xsl:for-each select="PatientBreath/PatientBreathItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率"/>
                                        <value xsi:type="PQ" value="" unit="次/min">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="PatientHeart/PatientHeartItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率"/>
                                        <value xsi:type="PQ" value="" unit="次/min">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--体格检查-血压（mmHg）-->
                            <xsl:for-each select="PressureInfo/row">
                                <entry>
                                    <organizer classCode="BATTERY" moodCode="EVN">
                                        <code displayName="血压"/>
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
                                                <value xsi:type="PQ" value="" unit="mmHg">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientSystolicPressure"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
                                                <value xsi:type="PQ" value="" unit="mmHg">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientDiastolicPressure"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    手术操作章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OperationInfo/row">
                                <entry>
                                    <!-- 1..1 手术记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
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
                                        <!--手术者姓名-->
                                        <performer>
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
                                        <!--手术间编号-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SurgeryRoom"/>
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
                                        <!--诊疗过程描述 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DiagProcessDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    失血章节
                    ********************************************************
                    -->
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
                    <!--
                    ********************************************************
                    术后去向章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="59775-7" displayName="Procedure disposition" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--患者去向代码 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.185.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者去向代码"/>
                                    <effectiveTime>
                                        <!--出手术室日期时间-->
                                        <high value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OutSurgeryRoomTime"/>
                                            </xsl:attribute>
                                        </high>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PatientGoCode"/>
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