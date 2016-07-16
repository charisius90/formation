package java;

public class MemberDTO {
	private String name;
	private String seq;
	private String position;
	private boolean participatingMember;
	private boolean startingMember;
	
	public MemberDTO(){}
	public MemberDTO(String name, String seq, String position, boolean participatingMember, boolean startingMember) {
		this.name = name;
		this.seq = seq;
		this.position = position;
		this.participatingMember = participatingMember;
		this.startingMember = startingMember;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public boolean isParticipatingMember() {
		return participatingMember;
	}
	public void setParticipatingMember(boolean participatingMember) {
		this.participatingMember = participatingMember;
	}
	public boolean isStartingMember() {
		return startingMember;
	}
	public void setStartingMember(boolean startingMember) {
		this.startingMember = startingMember;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", seq=" + seq + ", position=" + position + ", participatingMember="
				+ participatingMember + ", startingMember=" + startingMember + "]";
	}
}
