<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0802Rt">
        <POOR_IN200902UV ITSVersion="XML_1.0"
            xmlns="urn:hl7-org:v3"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/POOR_IN200902UV.xsd">
            <!-- 消息流水号 -->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!-- 消息创建时间 -->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <!-- 消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="POOR_IN200902UV"/>
            <!--处理代码，标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练 -->
            <processingCode code="P"/>
            <!-- 消息处理模式: A(Archive); I(Initial load); R(Restore from archive); T(Current 
            processing) -->
            <processingModeCode/>
            <!-- 消息应答: AL(Always); ER(Error/reject only); NE(Never) -->
            <acceptAckCode code="AL"/>
            <!-- 接受者 -->
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 接受者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="@111"/>
                    </id>
                </device>
            </receiver>
            <!-- 发送者 -->
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 发送者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="@222"/>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <placerGroup classCode="GROUPER" moodCode="RQO">
                        <!--医嘱开立者-->
                        <author typeCode="AUT" contextControlCode="OP">
                            <!--医嘱开立日期时间-->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="OrderTime"/>
                                </xsl:attribute>
                            </time>
                            <!--签名编码（固定值S）-->
                            <signatureCode code="S"/>
                            <!--医嘱开立者签名-->
                            <signatureText value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuthorSignatureText"/>
                                </xsl:attribute>
                            </signatureText>
                            <assignedEntity classCode="ASSIGNED">
                                <!--医务人员工号-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuthorWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--医嘱开立者-->
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AuthorName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                                <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <!--医疗卫生机构（科室）ID-->
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="RrepresentedOrganizationDeptId"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <!--医嘱开立科室-->
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="RrepresentedOrganizationDeptName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </representedOrganization>
                            </assignedEntity>
                        </author>
                        <!--医嘱审核者-->
                        <verifier typeCode="VRF" contextControlCode="OP">
                            <!--医嘱审核日期时间-->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="OrderAuditTime"/>
                                </xsl:attribute>
                            </time>
                            <!--签名编码（固定值S）-->
                            <signatureCode code="S"/>
                            <!--医嘱审核者签名-->
                            <signatureText value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="OrderAuditVerifierSign"/>
                                </xsl:attribute>
                            </signatureText>
                            <assignedEntity classCode="ASSIGNED">
                                <!--医务人员工号-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuditWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--医嘱审核者-->
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="OrderAuditVerifierName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedEntity>
                        </verifier>
                        <component2>
                            <!--医嘱序号-->
                            <sequenceNumber value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="OrderInfoNo"/>
                                </xsl:attribute>
                            </sequenceNumber>
                            <substanceAdministrationRequest classCode="SBADM" moodCode="RQO">
                                <!--医嘱ID-->
                                <id root="2.16.156.10011.1.28" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="OrderId"/>
                                    </xsl:attribute>
                                </id>
                                <!--医嘱项目类型代码-->
                                <code code="" codeSystem="2.16.156.10011.2.3.1.268">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="OrderItemTypeId"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="OrderItemTypeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                                <!--医嘱项目内容-->
                                <text value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="OrderItemContent"/>
                                    </xsl:attribute>
                                </text>
                                <!--医嘱状态-->
                                <statusCode code="active"/>
                                <!--医嘱有效期间:医嘱开始日期时间/医嘱结束日期时间-->
                                <effectiveTime xsi:type="QSC_TS" validTimeLow="" validTimeHigh="">
                                    <xsl:attribute name="validTimeLow">
                                        <xsl:value-of select="OrderTimeLow"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="validTimeHigh">
                                        <xsl:value-of select="OrderTimeHigh"/>
                                    </xsl:attribute>
                                    <!-- 医嘱执行频率编码/医嘱执行频率名称 -->
                                    <code code="" codeSystem="2.16.156.10011.2.5.1.13">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="FrequencyCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="FrequencyName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </code>
                                </effectiveTime>
                                <!--用药途径 -->
                                <routeCode code="" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="PurposeCode"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PurposeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </routeCode>
                                <!--用药剂量-单次 -->
                                <doseQuantity value="" unit="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="DoseSingle"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="unit">
                                        <xsl:value-of select="DoseSingleUnit"/>
                                    </xsl:attribute>
                                </doseQuantity>
                                <!--药物使用总剂量 -->
                                <doseCheckQuantity xsi:type="DSET_RTO">
                                    <item>
                                        <numerator xsi:type="PQ" unit="" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DoseTotal"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="unit">
                                                <xsl:value-of select="DoseTotalUnit"/>
                                            </xsl:attribute>
                                        </numerator>
                                        <denominator xsi:type="PQ" unit="d" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DoseTotalDays"/>
                                            </xsl:attribute>
                                        </denominator>
                                    </item>
                                </doseCheckQuantity>
                                <!--药物剂型 -->
                                <administrationUnitCode code="" codeSystem="2.16.156.10011.2.3.1.211" codeSystemName="药物剂型代码表">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="DosageFormCode"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DosageFormName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </administrationUnitCode>
                                <!-- 药物信息 -->
                                <consumable2 typeCode="CSM">
                                    <manufacturedProduct1 classCode="MANU">
                                        <!-- 包装序号 -->
                                        <id extension=""/>
                                        <manufacturedProduct classCode="MMAT" determinerCode="KIND">
                                            <!-- 药物编码 -->
                                            <code code="" codeSystem="2.16.156.10011.2.5.1.14">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="DrugCode"/>
                                                </xsl:attribute>
                                            </code>
                                            <name xsi:type="BAG_EN">
                                                <item>
                                                    <!--药物名称-->
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DrugName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <asContent classCode="CONT">
                                                <quantity/>
                                                <containerPackagedProduct classCode="HOLD" determinerCode="KIND">
                                                    <code/>
                                                    <formCode/>
                                                    <!--药物规格 -->
                                                    <capacityQuantity unit="" value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DrugSpec"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="unit">
                                                            <xsl:value-of select="DrugSpecUnit"/>
                                                        </xsl:attribute>
                                                    </capacityQuantity>
                                                </containerPackagedProduct>
                                            </asContent>
                                        </manufacturedProduct>
                                        <!-- 药物所属医保信息 -->
                                        <subjectOf3 typeCode="SBJ">
                                            <policy classCode="POLICY" moodCode="EVN">
                                                <!-- 药物医保类别编码/药物医保类别名称 -->
                                                <code code="">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DrugMITypeCode"/>
                                                    </xsl:attribute>
                                                    <displayName value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DrugMITypeName"/>
                                                        </xsl:attribute>
                                                    </displayName>
                                                </code>
                                            </policy>
                                        </subjectOf3>
                                    </manufacturedProduct1>
                                </consumable2>
                                <location typeCode="LOC">
                                    <serviceDeliveryLocation classCode="DSDLOC">
                                        <location classCode="PLC" determinerCode="INSTANCE">
                                            <!-- 执行科室编码 -->
                                            <id>
                                                <item root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="ServiceDeptCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <!-- 执行科室名称 -->
                                            <name xsi:type="BAG_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="ExecutionDeptName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </location>
                                    </serviceDeliveryLocation>
                                </location>
                                <!-- 父医嘱ID(没有父医嘱可以没有此occurrenceOf节点) -->
                                <occurrenceOf>
                                    <parentRequestReference classCode="GROUPER">
                                        <id extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="ParentOrderId"/>
                                            </xsl:attribute>
                                        </id>
                                    </parentRequestReference>
                                </occurrenceOf>
                                <!--医嘱类别（1 长期医嘱\2 临时医嘱\ 9 其他）-->
                                <pertinentInformation typeCode="PERT" contextConductionInd="false">
                                    <observation classCode="OBS " moodCode="EVN">
                                        <code code="DE06.00.286.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" />
                                        <!--医嘱类别编码/医嘱类别名称-->
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.58">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OrderTypeCode"/>
                                            </xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="OrderTypeCodeName"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observation>
                                </pertinentInformation>
                                <component2>
                                    <!-- 领量(给药量)/领量单位(实际发药量由药房发药确定) -->
                                    <supplyRequest classCode="SPLY" moodCode="RQO">
                                        <id/>
                                        <code/>
                                        <statusCode code="active"/>
                                        <!-- 领药量-->
                                        <quantity unit="" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="TakedDosage"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="unit">
                                                <xsl:value-of select="TakedDosageUnit"/>
                                            </xsl:attribute>
                                        </quantity>
                                        <!-- 开始时间/停止时间(可以都没有值) -->
                                        <expectedUseTime validTimeLow="" validTimeHigh=""/>
                                    </supplyRequest>
                                </component2>
                                <!--医嘱备注信息-->
                                <subjectOf6 typeCode="SUBJ" contextConductionInd="false">
                                    <seperatableInd value="false"/>
                                    <annotation>
                                        <!--医嘱备注信息-->
                                        <text value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OrderNote"/>
                                            </xsl:attribute>
                                        </text>
                                        <statusCode code="">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OrderNoteStatus"/>
                                            </xsl:attribute>
                                        </statusCode>
                                        <author>
                                            <assignedEntity classCode="ASSIGNED"/>
                                        </author>
                                    </annotation>
                                </subjectOf6>
                            </substanceAdministrationRequest>
                        </component2>
                        <!--就医信息-->
                        <componentOf1 contextConductionInd="false">
                            <encounter classCode="ENC" moodCode="EVN">
                                <id>
                                    <!-- 就诊次数 -->
                                    <item extension="" root="2.16.156.10011.2.5.1.8">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="VisitNum"/>
                                        </xsl:attribute>
                                    </item>
                                    <!-- 就诊流水号 -->
                                    <item extension="" root="2.16.156.10011.2.5.1.9">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AdmID"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--就诊类别编码-->
                                <code codeSystem="2.16.156.10011.2.3.1.271" code="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="AdmTypeCode"/>
                                    </xsl:attribute>
                                    <!-- 就诊类别名称 -->
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AdmTypeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                                <statusCode code="active"/>
                                <subject typeCode="SBJ">
                                    <patient classCode="PAT">
                                        <id>
                                            <!-- 域ID -->
                                            <item root="2.16.156.10011.2.5.1.5" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="DomainId"/>
                                                </xsl:attribute>
                                            </item>
                                            <!--患者ID标识-->
                                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PatientID"/>
                                                </xsl:attribute>
                                            </item>
                                            <!--门（急）诊号标识 -->
                                            <item root="2.16.156.10011.1.10" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="OutpatientId"/>
                                                </xsl:attribute>
                                            </item>
                                            <!--住院号标识-->
                                            <item root="2.16.156.10011.1.12" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="HospitalizationId"/>
                                                </xsl:attribute>
                                            </item>
                                        </id>
                                        <!--患者就医联系电话-->
                                        <telecom xsi:type="BAG_TEL">
                                            <item value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PatientTelcom"/>
                                                </xsl:attribute>
                                            </item>
                                        </telecom>
                                        <!--患者角色状态-->
                                        <statusCode code="active"/>
                                        <patientPerson classCode="PSN" determinerCode="INSTANCE">
                                            <!--患者身份证号-->
                                            <id>
                                                <item root="2.16.156.10011.1.3" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="IDCardNo"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="BAG_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PatientName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <!--性别-->
                                            <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表（GB/T 2261.1）">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientGenderCode"/>
                                                </xsl:attribute>
                                                <displayName value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="GenderName"/>
                                                    </xsl:attribute>
                                                </displayName>
                                            </administrativeGenderCode>
                                            <!--出生日期-->
                                            <birthTime value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BitrhTime"/>
                                                </xsl:attribute>
                                            </birthTime>
                                            <asOtherIDs classCode="ROL">
                                                <!--健康档案编号-->
                                                <id>
                                                    <item root="2.16.156.10011.1.2" extension="">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="HealthRecordId"/>
                                                        </xsl:attribute>
                                                    </item>
                                                    <!--健康卡号-->
                                                    <item root="2.16.156.10011.1.19" extension="">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="HealthCardCode"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <scopingOrganization classCode="ORG " determinerCode="INSTANCE " xsi:nil="true"/>
                                            </asOtherIDs>
                                        </patientPerson>
                                    </patient>
                                </subject>
                                <!--住院位置-->
                                <location typeCode="LOC">
                                    <time/>
                                    <serviceDeliveryLocation classCode="SDLOC">
                                        <location classCode="PLC" determinerCode="INSTANCE">
                                            <!--DE01.00.026.00	病床号-->
                                            <id>
                                                <item root="2.16.156.10011.1.22" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="BedNumber"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="BAG_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="BedName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <asLocatedEntityPartOf classCode="LOCE">
                                                <location classCode="PLC" determinerCode="INSTANCE">
                                                    <!--DE01.00.019.00	病房号-->
                                                    <id>
                                                        <item root="2.16.156.10011.1.21" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="RoomNumber"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="BAG_EN">
                                                        <item>
                                                            <part value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="RoomName"/>
                                                                </xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                </location>
                                            </asLocatedEntityPartOf>
                                        </location>
                                        <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--DE08.10.026.00	科室名称-->
                                            <id>
                                                <item root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DeptId"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="BAG_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DeptName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <asOrganizationPartOf classCode="PART">
                                                <!-- DE08.10.054.00	病区名称 -->
                                                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                    <id>
                                                        <item root="2.16.156.10011.1.27" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="InpatientAreaId"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="BAG_EN">
                                                        <item>
                                                            <part value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="InpatientAreaName"/>
                                                                </xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                </wholeOrganization>
                                            </asOrganizationPartOf>
                                        </serviceProviderOrganization>
                                    </serviceDeliveryLocation>
                                </location>
                            </encounter>
                        </componentOf1>
                    </placerGroup>
                </subject>
            </controlActProcess>
        </POOR_IN200902UV>
    </xsl:template>
</xsl:stylesheet>