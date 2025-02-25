package com.dcits.supervise.pecr.generateReport.entity;

import java.io.Serializable;

/**
 * 报文信息和反馈报文信息
 * @author munan
 *
 */
public class ReportAndBackMessageEnt implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4975879999560989627L;
	private String report_message_id;
	private String report_message_file_name;
	private String report_message_type;
	private String report_message_status;
	private String txt_report_message_file_path;
	private String zip_report_message_file_path;
	private String enc_report_message_file_path;
	private String abnorm_reportmessage_filepath;
	private Float record_num;
	private String create_time;
	private String create_success_time;
	private String report_time;
	private String operator_user;
	private String company;
	private String org_code;
	private String description;
	private String feedback_message_file_name;
	private String feedback_message_create_time;
	private String feedback_message_rec_time;
	private String feedback_message_identify;
	private String feedback_message_file_path;
	private Float fk_success_number;
	private Float fk_fail_number;
	
	public String getCompany(){
		return company;
	}
	public void setCompany(String company){
		this.company = company;
	}
	public String getReport_message_id() {
		return report_message_id;
	}
	public void setReport_message_id(String report_message_id) {
		this.report_message_id = report_message_id;
	}
	public String getReport_message_file_name() {
		return report_message_file_name;
	}
	public void setReport_message_file_name(String report_message_file_name) {
		this.report_message_file_name = report_message_file_name;
	}
	public String getReport_message_type() {
		return report_message_type;
	}
	public void setReport_message_type(String report_message_type) {
		this.report_message_type = report_message_type;
	}
	public String getReport_message_status() {
		return report_message_status;
	}
	public void setReport_message_status(String report_message_status) {
		this.report_message_status = report_message_status;
	}
	public String getTxt_report_message_file_path() {
		return txt_report_message_file_path;
	}
	public void setTxt_report_message_file_path(String txt_report_message_file_path) {
		this.txt_report_message_file_path = txt_report_message_file_path;
	}
	public String getZip_report_message_file_path() {
		return zip_report_message_file_path;
	}
	public void setZip_report_message_file_path(String zip_report_message_file_path) {
		this.zip_report_message_file_path = zip_report_message_file_path;
	}
	public String getEnc_report_message_file_path() {
		return enc_report_message_file_path;
	}
	public void setEnc_report_message_file_path(String enc_report_message_file_path) {
		this.enc_report_message_file_path = enc_report_message_file_path;
	}
	public String getAbnorm_reportmessage_filepath() {
		return abnorm_reportmessage_filepath;
	}
	public void setAbnorm_reportmessage_filepath(String abnorm_reportmessage_filepath) {
		this.abnorm_reportmessage_filepath = abnorm_reportmessage_filepath;
	}
	public Float getRecord_num() {
		return record_num;
	}
	public void setRecord_num(Float record_num) {
		this.record_num = record_num;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getCreate_success_time() {
		return create_success_time;
	}
	public void setCreate_success_time(String create_success_time) {
		this.create_success_time = create_success_time;
	}
	public String getReport_time() {
		return report_time;
	}
	public void setReport_time(String report_time) {
		this.report_time = report_time;
	}
	public String getOperator_user() {
		return operator_user;
	}
	public void setOperator_user(String operator_user) {
		this.operator_user = operator_user;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFeedback_message_file_name() {
		return feedback_message_file_name;
	}
	public void setFeedback_message_file_name(String feedback_message_file_name) {
		this.feedback_message_file_name = feedback_message_file_name;
	}
	public String getFeedback_message_create_time() {
		return feedback_message_create_time;
	}
	public void setFeedback_message_create_time(String feedback_message_create_time) {
		this.feedback_message_create_time = feedback_message_create_time;
	}
	public String getFeedback_message_rec_time() {
		return feedback_message_rec_time;
	}
	public void setFeedback_message_rec_time(String feedback_message_rec_time) {
		this.feedback_message_rec_time = feedback_message_rec_time;
	}
	public String getFeedback_message_identify() {
		return feedback_message_identify;
	}
	public void setFeedback_message_identify(String feedback_message_identify) {
		this.feedback_message_identify = feedback_message_identify;
	}
	public String getFeedback_message_file_path() {
		return feedback_message_file_path;
	}
	public void setFeedback_message_file_path(String feedback_message_file_path) {
		this.feedback_message_file_path = feedback_message_file_path;
	}
	public Float getFk_success_number() {
		return fk_success_number;
	}
	public void setFk_success_number(Float fk_success_number) {
		this.fk_success_number = fk_success_number;
	}
	public Float getFk_fail_number() {
		return fk_fail_number;
	}
	public void setFk_fail_number(Float fk_fail_number) {
		this.fk_fail_number = fk_fail_number;
	}
	
}
