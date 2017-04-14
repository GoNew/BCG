package bcg.common.dao;

import java.util.List;

import bcg.common.entity.Class;
import bcg.common.entity.CompareBook;
import bcg.common.entity.Genre;

public interface RecommendDAO {
	//�帣 ������
	public List<Genre> getGenreList();
	
	//ī�װ� ������
	public List<Class> getClassList();
	
	//���� ������ ������ å ����Ʈ ������
	public List<CompareBook> getSortedBookList();
	
}
