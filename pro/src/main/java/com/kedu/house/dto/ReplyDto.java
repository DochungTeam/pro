package com.kedu.house.dto;

import java.util.Date;

public class ReplyDto {

  private Integer rno;
  private Integer hno;
  private String replytext;
  private String replyer;

  private Date regdate;
  private Date updatedate;

  public Integer getRno() {
    return rno;
  }

  public void setRno(Integer rno) {
    this.rno = rno;
  }

  public Integer getHno() {
    return hno;
  }

  public void setHno(Integer hno) {
    this.hno = hno;
  }

  public String getReplytext() {
    return replytext;
  }

  public void setReplytext(String replytext) {
    this.replytext = replytext;
  }

  public String getReplyer() {
    return replyer;
  }

  public void setReplyer(String replyer) {
    this.replyer = replyer;
  }

  public Date getRegdate() {
    return regdate;
  }

  public void setRegdate(Date regdate) {
    this.regdate = regdate;
  }

  public Date getUpdatedate() {
    return updatedate;
  }

  public void setUpdatedate(Date updatedate) {
    this.updatedate = updatedate;
  }

  @Override
  public String toString() {
    return "ReplyDto [rno=" + rno + ", hno=" + hno + ", replytext=" + replytext + ", replyer=" + replyer + ", regdate="
        + regdate + ", updatedate=" + updatedate + "]";
  }
}
