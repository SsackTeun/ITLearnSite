package question.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import question.db.QuestionBean;
import question.db.QuestionDAOImpl;

public class QuestionServiceImpl implements QuestionService {
	QuestionDAOImpl qDao;

	public QuestionServiceImpl() {
		qDao = new QuestionDAOImpl();
	}
	
		// 글쓰기
			@Override
			public int addQuestion(QuestionBean qBean) {
				return qDao.insertQuestion(qBean);
			}
			
		// 글수정
			@Override
			public void modQuestion(QuestionBean qBean) {
				qDao.updateQuestion(qBean);
			}
			
		// 글보기
		@Override
		public QuestionBean questionView(int ques_no) {
			QuestionBean qBean = qDao.questionView(ques_no);
			return qBean;
		}
		// 글삭제
		@Override
		public void questionDelete(int ques_no) {
			qDao.questionDelete(ques_no);

		}
		
		
		// 리스트 - 공지글
				@Override
				public Map listQuestion1(Map<String, Integer> pagingMap) {
					Map questionsMap1 = new HashMap();
					// 전달된 pagingMap 사용, 글 목록 조회
					//List<QuestionBean> questionsList = qDao.selectAllQuestions(pagingMap);
					List<QuestionBean> questionsList1 = qDao.selectNotice();
					// 테이블에 존재하는 전체 글 수 조회
					//int totQuestions = qDao.selectTotQuestions();
					// 조회된 글 목록을 ArrayList에 저장, 다시 HashMap에 저장
					questionsMap1.put("questionsList1", questionsList1);
					// 조회된 전체 글 수를 HashMap에 저장
					//questionsMap1.put("totQuestions", totQuestions);
					return questionsMap1;
				}
		
		
		// 리스트- 일반글
		@Override
		public Map listQuestion2(Map<String, Integer> pagingMap) {

			Map questionsMap2 = new HashMap();
			// 전달된 pagingMap 사용, 글 목록 조회
			//List<QuestionBean> questionsList = qDao.selectAllQuestions(pagingMap);
			List<QuestionBean> questionsList2 = qDao.selectQuestions(pagingMap);
			// 테이블에 존재하는 전체 글 수 조회
			int totQuestions = qDao.selectTotQuestions();
			// 조회된 글 목록을 ArrayList에 저장, 다시 HashMap에 저장
			questionsMap2.put("questionsList2", questionsList2);
			// 조회된 전체 글 수를 HashMap에 저장
			questionsMap2.put("totQuestions", totQuestions);
			// articlesMap.put("totArticles", 170);
			return questionsMap2;
		}
		
		
		// 조회수 증가
		@Override
		public void updateReadcount(int ques_no) {
			qDao.updateReadcount(ques_no);
		}
		
		
		// 검색
		@Override
		public ArrayList<QuestionBean> questionSelect(String opt,String condition){
			System.out.println("question select service");
			HashMap<String, Object> listOpt = new HashMap<String, Object>();
			listOpt.put("opt", opt);
			listOpt.put("condition", condition);
			ArrayList<QuestionBean> QuestionList = qDao.questionSelect(listOpt);
			return QuestionList;

		}

		// 답글쓰기
		@Override
		public int addReply(QuestionBean qBean) {
			return qDao.insertQuestion(qBean);
		}
		
}
