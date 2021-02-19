<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0034">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.54"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0034" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>入院记录</title>
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
                    <!--单节点-->
                    <addr use="H">
                        <houseNumber>
                            <xsl:value-of select="LivingAddress/HouseNumber"/>
                        </houseNumber>
                        <streetName>
                            <xsl:value-of select="LivingAddress/StreetName"/>
                        </streetName>
                        <township>
                            <xsl:value-of select="LivingAddress/Township"/>
                        </township>
                        <county>
                            <xsl:value-of select="LivingAddress/County"/>
                        </county>
                        <city>
                            <xsl:value-of select="LivingAddress/City"/>
                        </city>
                        <state>
                            <xsl:value-of select="LivingAddress/State"/>
                        </state>
                    </addr>

                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Patient/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="Patient/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="Patient/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="Patient/GenderName"/>
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
                                <xsl:value-of select="Patient/PatientAge"/>
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
                <time xsi:type="TS" value="">
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
            <!-- 病史陈述者 单节点-->
            <xsl:for-each select="HistoryTeller/row">
                <informant>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <!--陈述者与患者的关系代码-->
                        <code code="" displayName="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="RelCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="RelName"/>
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
                        <xsl:value-of select="FinalReviewer/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="FinalReviewer/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="主任医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="FinalReviewer/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 接诊医师签名 -->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="DiagDoctor/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="DiagDoctor/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="接诊医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="DiagDoctor/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!--住院医师签名-->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="ResidentDoctor/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ResidentDoctor/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="住院医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="ResidentDoctor/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>
            <!--主治医师签名-->
            <authenticator>
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="AttendingDoctor/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AttendingDoctor/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="主治医师"/>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AttendingDoctor/Name"/>
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
                    <!-- 入院日期时间 DE06.00.092.00 -->
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
                                                <xsl:value-of select="Hospital/BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="Hospital/BedName"/>
                                        </name>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="Hospital/RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="Hospital/RoomName"/>
                                                </name>
                                                <!-- DE08.10.026.00科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="Hospital/DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="Hospital/DeptName"/>
                                                        </name>
                                                        <!-- DE08.10.054.00病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="Hospital/AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="Hospital/AreaName"/>
                                                                </name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="">
                                                                            <xsl:attribute name="extension">
                                                                                <xsl:value-of select="Hospital/OrganCode"/>
                                                                            </xsl:attribute>
                                                                        </id>
                                                                        <name>
                                                                            <xsl:value-of select="Hospital/OrganName"/>
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
                    <!--现病史章节-->
                    <component>
                        <section>
                            <code code="10164-2" displayName="HISTORY OF PRESENT ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--现病史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.071.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="现病史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentIllnessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--既往史章节-->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--一般健康状况标志-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般健康状况标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="HealthStatusSign"/>
                                        </xsl:attribute>
                                    </value>
                                    <!--疾病史（含外伤）-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE02.10.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病史（含外伤）"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="HoD"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--患者传染性标志-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者传染性标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="InfectiousSign"/>
                                        </xsl:attribute>
                                    </value>
                                    <!--传染病史-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE02.10.008.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="传染病史"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="HoID"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--婚育史条目-->
                            <xsl:for-each select="HoM/HoMItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="婚育史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--过敏史条目-->
                            <xsl:for-each select="HoA/HoAItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--手术史条目-->
                            <xsl:for-each select="HoO/HoOItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--预防免疫史章节-->
                    <component>
                        <section>
                            <code code="11369-6" displayName="HISTORY OF IMMUNIZATIONS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.101.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="预防接种史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoV"/>
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
                            <!--输血史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.100.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoT"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--个人史章节-->
                    <component>
                        <section>
                            <code code="29762-2" displayName="Social history" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--个人史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="个人史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoP"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--月经史章节-->
                    <component>
                        <section>
                            <code code="49033-4" displayName="Menstrual History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--月经史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="月经史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HoMenstruation"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--家族史章节-->
                    <xsl:for-each select="HoF/HoFItem">
                        <component>
                            <section>
                                <code code="10157-6" displayName="HISTORY OF FAMILY MEMBER DISEASES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                                <text/>
                                <!--家族史条目-->
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="家族史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </section>
                        </component>
                    </xsl:for-each>
                    <!--生命体征章节-->
                    <component>
                        <section>
                            <code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
                            <text/>
                            <!--体格检查-体温（℃）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温（℃）"/>
                                    <value xsi:type="PQ" value="" unit="℃">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="Temperature"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-脉率（次/min）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率（次/min）"/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PulseRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-呼吸频率（次/min）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.082.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min）"/>
                                    <value xsi:type="PQ" value="" unit="次/min">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BreathRate"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-血压（mmHg）-->
                            <entry>
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <code displayName="血压"/>
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
                            <!--体格检查-身高（cm）-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.167.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="身高（cm）"/>
                                    <value xsi:type="PQ" value="" unit="cm">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientHeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-体重（kg）-->
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
                    <!--体格检查章节-->
                    <component>
                        <section>
                            <code code="29545-1" displayName="PHYSICAL EXAMINATION" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--体格检查-一般状况检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.219.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般状况检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="GeneralExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-皮肤和黏膜检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.126.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="皮肤和黏膜检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SkinMucosaExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-全身浅表淋巴结检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.114.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="全身浅表淋巴结检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SuperficialLymphExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-头部及其器官检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.261.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="头部及其器官检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HeadExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-颈部检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.255.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颈部检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="NeckExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-胸部检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.263.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胸部检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChestExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-腹部检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.046.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="腹部检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AbdomenExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-肛门指诊检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.065.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肛门指诊检查结果描述"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DigitalAnalExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-外生殖器检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.195.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="外生殖器检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ExternalGenitaliaExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-脊柱检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.093.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脊柱检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SpineExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-四肢检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="四肢检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LimbsExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--体格检查-神经系统检查结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.149.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="神经系统检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="NervousSystemExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--专科情况-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="专科情况"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SpecialExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--辅助检查章节-->
                    <xsl:for-each select="AuxExamResult/AuxExamResultItem">
                        <component>
                            <section>
                                <code displayName="辅助检查"/>
                                <text/>
                                <!--辅助检查结果条目-->
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="辅助检查结果"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </section>
                        </component>
                    </xsl:for-each>
                    <!--
              ********************************************************
              主要健康问题章节
              ********************************************************
              -->
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
                            <!--初步诊断-西医条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-西医诊断名称"/>
                                    <!--初步诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PreWesternDiag/Time"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PreWesternDiag/Value"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--初步诊断-西医诊断编码-代码-->
                                            <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-西医诊断编码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PreWesternDiag/Code"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PreWesternDiag/Name"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--入院诊断顺位-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PreWesternDiag/AdmSequence"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--中医“四诊”观察结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医“四诊”观察结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChineseObserveDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--初步诊断-中医条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医病名名称"/>
                                    <!--初步诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PreChineseDiag/Time"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PreChineseDiag/Value"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--初步诊断-中医诊断编码-代码-->
                                            <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医病名代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PreChineseDiag/Code"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PreChineseDiag/Name"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--初步诊断-中医证候编码-名称-->
                                            <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医证候名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="PreChineseDiag/SymptomValue"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--初步诊断-中医证候编码-代码-->
                                            <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初步诊断-中医证候代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PreChineseDiag/SymptomCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="PreChineseDiag/SymptomName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--入院诊断顺位-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PreChineseDiag/AdmSequence"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--修正诊断-西医条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-西医诊断名称"/>
                                    <!--修正诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="CorrectWesternDiag/Time"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="CorrectWesternDiag/Value"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--修正诊断-西医诊断编码-代码-->
                                            <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-西医诊断编码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="CorrectWesternDiag/Code"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="CorrectWesternDiag/Name"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--入院诊断顺位-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CorrectWesternDiag/AdmSequence"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--修正诊断-中医条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医病名名称"/>
                                    <!--修正诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="CorrectChineseDiag/Time"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="CorrectChineseDiag/Value"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--修正诊断-中医诊断编码-代码-->
                                            <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医病名代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="CorrectChineseDiag/Code"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="CorrectChineseDiag/Name"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--修正诊断-中医证候编码-名称-->
                                            <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医证候名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="CorrectChineseDiag/Value"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--修正诊断-中医证候编码-代码-->
                                            <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="修正诊断-中医证候代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="CorrectChineseDiag/SymptomCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="CorrectChineseDiag/SymptomName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--入院诊断顺位-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CorrectChineseDiag/AdmSequence"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--确定诊断-西医条目-->
                            <xsl:for-each select="ConfirmWesternDiag/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-西医诊断名称"/>
                                        <!--确定诊断日期-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="Time"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="Value"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--确定诊断-西医诊断编码-代码-->
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-西医诊断编码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="Code"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="Name"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--入院诊断顺位-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                                <value xsi:type="INT" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="AdmSequence"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--确定诊断-中医条目-->
                            <xsl:for-each select="ConfirmChineseDiag/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医病名名称"/>
                                        <!--确定诊断日期-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="Time"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="Value"/>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--确定诊断-中医诊断编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医病名代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="Code"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="Name"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--确定诊断-中医证候编码-名称-->
                                                <code code="DE05.10.172.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医证候名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="SymptomValue"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--确定诊断-中医证候编码-代码-->
                                                <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="确定诊断-中医证候代码"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="SymptomCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="SymptomName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--入院诊断顺位-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                                <value xsi:type="INT" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="AdmSequence"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!--补充诊断-西医条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="补充诊断-西医诊断名称"/>
                                    <!--补充诊断日期-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SupWesternDiag/Time"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SupWesternDiag/Value"/>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <!--补充诊断-西医诊断编码-代码-->
                                            <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="补充诊断-西医诊断编码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="SupWesternDiag/Code"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="SupWesternDiag/Name"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                    <!--入院诊断顺位-->
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.080.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院诊断顺位"/>
                                            <value xsi:type="INT" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="SupWesternDiag/AdmSequence"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--治疗计划章节-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--治则治法条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="治则治法"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrincipleDesc"/>
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