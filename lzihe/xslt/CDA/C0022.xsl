<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0022">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.42"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0022" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>高值耗材使用记录</title>
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
            <!--N:默认无，支持RPLC\APND\XFRM-->
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
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="DiagCode/DiagCodeItem">
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--高值耗材章节（同用药章节） -->
                    <component>
                        <section>
                            <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <substanceAdministration classCode="SBADM" moodCode="EVN">
                                    <text/>
                                    <!--使用途径：DE06.00.242.00-->
                                    <routeCode nullFlavor="OTH">
                                        <originalText>
                                            <xsl:value-of select="ConsumablesUseDesc"/>
                                        </originalText>
                                    </routeCode>
                                    <!--耗材数量DE06.00.241.00、耗材单位DE08.50.034.00 -->
                                    <doseQuantity value="" unit="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ConsumablesQuantity"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="unit">
                                            <xsl:value-of select="ConsumablesUnit"/>
                                        </xsl:attribute>
                                    </doseQuantity>
                                    <consumable>
                                        <manufacturedProduct>
                                            <!--产品编码-->
                                            <id>
                                                <xsl:value-of select="ConsumablesCode"/>
                                            </id>
                                            <manufacturedMaterial>
                                                <!--材料名称 -->
                                                <code/>
                                                <name>
                                                    <xsl:value-of select="ConsumablesName"/>
                                                </name>
                                            </manufacturedMaterial>
                                            <manufacturerOrganization>
                                                <name>
                                                    <xsl:value-of select="ManufacturerName"/>
                                                </name>
                                                <asOrganizationPartOf>
                                                    <wholeOrganization>
                                                        <name>
                                                            <xsl:value-of select="SupplierName"/>
                                                        </name>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </manufacturerOrganization>
                                        </manufacturedProduct>
                                    </consumable>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.035.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="产品供应商"/>
                                            <value xsi:type="ST"/>
                                        </observation>
                                    </entryRelationship>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.50.058.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="植入性耗材标志"/>
                                            <!-- 植入性耗材标志：DE08.50.058.00 -->
                                            <value xsi:type="BL" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ImplantableSign"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </substanceAdministration>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>