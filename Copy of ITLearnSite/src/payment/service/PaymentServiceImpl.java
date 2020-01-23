package payment.service;

import java.util.List;

import lecture.db.PaylecBean;
import payment.db.PaymentBean;
import payment.db.PaymentDAOImpl;

public class PaymentServiceImpl implements PaymentService{

	PaymentDAOImpl pDao = new PaymentDAOImpl();
	
	//전체 주문 목록 
	@Override
	public List<PaymentBean> getPaymentlist() {
		List<PaymentBean> listPayment = pDao.getPaymentlist();
		return listPayment;
	}
	
	//회원 전체주문 확인
    @Override
    public List<PaymentBean> callPayment(String email){
    	List<PaymentBean> pBean = pDao.callPayment(email);
		return pBean;
    }
  	
  	//회원 주문 하기
    @Override
  	public void insertPayment(PaymentBean pBean){
    	pDao.insertPayment(pBean);		
    }
  	
  	//회원 주문 취소
    @Override
  	public void deletePayment(String email){
    	pDao.deletePayment(email);		
    }
    
    //회원 결제 확인
    public void updatePayment(int pay_no,int pay_option){
    	pDao.updatePayment(pay_no,pay_option);	
    }
    
    //결제 확인 시 강의리스트 insert
    public PaylecBean setPay_lec(int pay_no){
    	PaylecBean plBean = pDao.setPay_lec(pay_no);
    	return plBean;
    }
  
}
