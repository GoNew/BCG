package bcg.common.dao;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;

import bcg.common.api.APIExamSearchTemp;
import bcg.common.entity.CompareBook;

@Repository
public class SearchDAOImpl implements SearchDAO {

	private final String namespace = "com.bcg.mappers.bookmapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	RedisTemplate<String, String> redisTemplate;

	@Resource(name = "redisTemplate")
	private HashOperations<String, String, String> hashOperations;

	@Autowired
	private APIExamSearchTemp api;

	@Override
	public String makeQuery(String title) {
		String query = "select bookcode, title, imgurl, totalscore from bookinfo where title like %" + title + "%";
		System.out.println("SYTEST: �ۼ��� �������--> " + query);
		return query;
	}

	@Override
	public List<CompareBook> searchFromDB(String title) {
		return null;
	}

	@Override
	public void searchFromRedis(String title) {
		// TODO Auto-generated method stub
		JSONObject bookobj = null;
		JSONObject booksobj = null;
		String key = "cachedQuery";
		// ���� ���������
		String query = makeQuery(title);
		// redis�� �� ���� �ִ��� Ȯ��
		String result = hashOperations.get(key, query);
		// ������
		if (result.equals("")) {
			bookobj = new JSONObject();
			booksobj = new JSONObject();
			List<CompareBook> books = searchFromOracle(title);
			Iterator<CompareBook> iter = books.iterator();
			while (iter.hasNext()) {
				CompareBook book = iter.next();
				bookobj.put("title", book.getTitle());
				bookobj.put("totalscore", String.valueOf(book.getTotalScore()));
				bookobj.put("imgurl", book.getImgurl());
				bookobj.put("bookcode", book.getBookCode());
				booksobj.put("book", bookobj.toJSONString());
				System.out.println("SYTEST: hash�� ����� ����� value--> " + bookobj.toJSONString());
				hashOperations.put(key, book.getTitle(), bookobj.toJSONString());
				// json �������� ���ξ��ϴµ� �𸣰���.
			}
			// hashOperations.put("cachedQuery", query, value);
		} else {
			// ������
		}

	}

	@Override
	public List<CompareBook> searchFromOracle(String title) {
		// TODO Auto-generated method stub
		String stmt = namespace + "selectByTitle";
		List<CompareBook> books = sqlSession.selectList(stmt);
		return books;
	}

}
