package movie;

public class AdMovieVO {
	private int no;
	private String docid;
	private String advertisement_title;
	private String movie_advertisement_similarity;
	private String advertisement_img;
	private String advertisement_link;
	private String base_movie_docid;
	private String target_movie_docid;
	private String similarities_movies;
	private String base_movie_title;
	private String target_movie_title;
	
	public String getBase_movie_title() {
		return base_movie_title;
	}
	public void setBase_movie_title(String base_movie_title) {
		this.base_movie_title = base_movie_title;
	}
	public String getTarget_movie_title() {
		return target_movie_title;
	}
	public void setTarget_movie_title(String target_movie_title) {
		this.target_movie_title = target_movie_title;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getDocid() {
		return docid;
	}
	public void setDocid(String docid) {
		this.docid = docid;
	}
	public String getAdvertisement_title() {
		return advertisement_title;
	}
	public void setAdvertisement_title(String advertisement_title) {
		this.advertisement_title = advertisement_title;
	}
	public String getMovie_advertisement_similarity() {
		return movie_advertisement_similarity;
	}
	public void setMovie_advertisement_similarity(String movie_advertisement_similarity) {
		this.movie_advertisement_similarity = movie_advertisement_similarity;
	}
	public String getAdvertisement_img() {
		return advertisement_img;
	}
	public void setAdvertisement_img(String advertisement_img) {
		this.advertisement_img = advertisement_img;
	}
	public String getAdvertisement_link() {
		return advertisement_link;
	}
	public void setAdvertisement_link(String advertisement_link) {
		this.advertisement_link = advertisement_link;
	}
	public String getBase_movie_docid() {
		return base_movie_docid;
	}
	public void setBase_movie_docid(String base_movie_docid) {
		this.base_movie_docid = base_movie_docid;
	}
	public String getTarget_movie_docid() {
		return target_movie_docid;
	}
	public void setTarget_movie_docid(String target_movie_docid) {
		this.target_movie_docid = target_movie_docid;
	}
	public String getSimilarities_movies() {
		return similarities_movies;
	}
	public void setSimilarities_movies(String similarities_movies) {
		this.similarities_movies = similarities_movies;
	}

	
}
