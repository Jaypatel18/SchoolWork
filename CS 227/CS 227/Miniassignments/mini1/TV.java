package mini1;

public class TV {
	private int currentchannel;
	private int maxchannel;
	private double volume;
	private int firstchannel;
	public static final double VOLUME_INCREMENT = 0.07;
	public TV(int givenChannelMax){
		maxchannel=givenChannelMax-1;
		currentchannel = 0;
		volume=0.50;
		
	}
	public void channelDown() {
		firstchannel=currentchannel;
		if(currentchannel>0)
			currentchannel--;
		else
		{
			currentchannel=maxchannel;
		}
		
		
		
	}
	public void channelUp() {
		firstchannel=currentchannel;
		if (currentchannel<maxchannel) 
			currentchannel++;
			else {
				currentchannel=0;
				
			}
		
		
	}
	
	
	public int getChannel() {
		return currentchannel;
	}
	
	
	public double getVolume() {
	
		return volume;
	}
	
	
	public void goToPreviousChannel() { 
		currentchannel=firstchannel;
		
	}
	
	
	public void setChannel(int number) {
		firstchannel=currentchannel;
		if (number>maxchannel){
			currentchannel=maxchannel;
		}
		else if(number<0){
			currentchannel=0;
			
		}
		else{		
			currentchannel=number;
		}
		
	}
	
	
	public void volumeDown() {
		if (volume>=VOLUME_INCREMENT)
		{
			volume=volume-VOLUME_INCREMENT;
		}
			else {
				volume=0;
			}
		
	}
	
	
	public void volumeUp() {
		if (volume<=1-VOLUME_INCREMENT)
		{
			volume=volume+VOLUME_INCREMENT;
		}
			else {
				volume=1;
			}
		
	}

}

