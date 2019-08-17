package cn.web.pack.object;

public class Shuttle {

	private int id;

	private int time;

	private double price;

	private Plane plane;

	private Airport startAir;

	public Airport getStartAir() {
		return startAir;
	}

	public void setStartAir(Airport startAir) {
		this.startAir = startAir;
	}

	public Airport getStopAir() {
		return stopAir;
	}

	public void setStopAir(Airport stopAir) {
		this.stopAir = stopAir;
	}

	private Airport stopAir;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Shuttle(int id, int time, double price) {
		super();
		this.id = id;
		this.time = time;
		this.price = price;
	}

	public Plane getPlane() {
		return plane;
	}

	public void setPlane(Plane plane) {
		this.plane = plane;
	}

}
