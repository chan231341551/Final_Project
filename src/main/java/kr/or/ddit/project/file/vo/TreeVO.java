package kr.or.ddit.project.file.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="id")
public class TreeVO {

	private String id;
	private String parent;
	private String text;
	private String proCode;
}
