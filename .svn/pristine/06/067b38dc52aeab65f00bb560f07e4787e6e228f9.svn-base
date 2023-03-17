package kr.or.ddit.commons.org;

import java.io.Serializable;

//DB 행 하나를 담거나 전달할 때 필요한 객체 DTO를 만든다.
public class TreeDTO implements Serializable{
 
  private String orgcode;
  private String orguppercode;
  private String orgname;
  private int orglevel;
  private String []order2;

  public TreeDTO() {
     
  }
 
  /**
   * @param orgcode
   * @param orguppercode
   * @param orgname
   * @param orglevel
   * @param order2
   */
  public TreeDTO(String orgcode, String orguppercode, String orgname,
          int orglevel, String []order2) {
     
      this.orgcode = orgcode;
      this.orguppercode = orguppercode;
      this.orgname = orgname;
      this.orglevel = orglevel;
      this.order2 = order2;
  }
 
 
  /**
   * @return Returns the order2.
   */
  public String[] getOrder2() {
      return order2;
  }
  /**
   * @param order2 The order2 to set.
   */
  public void setOrder2(String[] order2) {
      this.order2 = order2;
  }
  /**
   * @return Returns the orgcode.
   */
  public String getOrgcode() {
      return orgcode;
  }
  /**
   * @param orgcode The orgcode to set.
   */
  public void setOrgcode(String orgcode) {
      this.orgcode = orgcode;
  }
  /**
   * @return Returns the orglevel.
   */
  public int getOrglevel() {
      return orglevel;
  }
  /**
   * @param orglevel The orglevel to set.
   */
  public void setOrglevel(int orglevel) {
      this.orglevel = orglevel;
  }
  /**
   * @return Returns the orgname.
   */
  public String getOrgname() {
      return orgname;
  }
  /**
   * @param orgname The orgname to set.
   */
  public void setOrgname(String orgname) {
      this.orgname = orgname;
  }
  /**
   * @return Returns the orguppercode.
   */
  public String getOrguppercode() {
      return orguppercode;
  }
  /**
   * @param orguppercode The orguppercode to set.
   */
  public void setOrguppercode(String orguppercode) {
      this.orguppercode = orguppercode;
  }
}