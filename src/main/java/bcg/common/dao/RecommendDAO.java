package bcg.common.dao;

import java.util.List;

import bcg.common.entity.Class;
import bcg.common.entity.CompareBook;
import bcg.common.entity.Genre;

public interface RecommendDAO {
	//장르 얻어오기
	public List<Genre> getGenreList();
	
	//카테고리 얻어오기
	public List<Class> getClassList();
	
	//점수 순으로 정렬한 책 리스트 얻어오기
	public List<CompareBook> getSortedBookList();
	
}
