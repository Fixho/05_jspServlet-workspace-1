package controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PizzaOrder
 */
@WebServlet("/order.do")
public class PizzaOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PizzaOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 1. 요청시 전달값 뽑기
		request.setCharacterEncoding("utf-8");
		
		String userName = request.getParameter("userName"); // "홍길동"
		String phone = request.getParameter("phone");		// "01011112222"
		String address = request.getParameter("address");	// "서울"
		String message = request.getParameter("message");	// "빨리" | ""
		
		String pizza = request.getParameter("pizza"); 		// "치즈피자"
		String[] toppings = request.getParameterValues("topping"); // ["xx", "xx"] | null
		String[] sides = request.getParameterValues("side"); // ["xx", "xx"] | null
		String payment = request.getParameter("payment"); // "card" | "cash"
		
		System.out.println("이름: " + userName);
		System.out.println("전화번호: " + phone);
		System.out.println("주소: " + address);
		System.out.println("요청사항: " + message);
		
		System.out.println("피자: " + pizza);
		System.out.println("토핑: " + Arrays.toString(toppings));
		System.out.println("사이드: " + Arrays.toString(sides));
		System.out.println("결제방식: " + payment);
		
		// 2. 요청처리 (주로 JDBC)
		//    => service => dao => 쿼리 실행 => 결과 돌려받기
		String orderNo = "20240828-1239451"; // 요청 처리 후 주문번호 돌려받음
		
		// 3. 돌려받은 결과를 가지고 응답페이지
		//    응답페이지 : 주문결과페이지.jsp 
		//    응답페이지 제작하는 과정을 jsp로 이동(forward)해서 진행
		/*
		 * 단, forward(이동) 되는 응답 jsp 상에 필요한 데이터는 request에 담아서 전달해야됨
		 * 
		 * * HttpServletRequest 응답데이터 처리 메소드
		 *   1) setAttribute(String 속성, Object 값) : forward하는 jsp에서 사용할 데이터를 담는 메소드
		 *   2) getAttribute(String 속성) 			 : 해당 데이터를 Object 타입으로 반환 (형변환이 필요할수있음)
		 *   3) removeAttribute(String 속성)		 : 해당 데이터를 제거하는 메소드
		 */
		request.setAttribute("userName", userName);
		request.setAttribute("orderNo", orderNo);
		request.setAttribute("pizza", pizza);
		request.setAttribute("toppings", toppings);
		request.setAttribute("sides", sides);
		request.setAttribute("payment", payment);
	
		request.getRequestDispatcher("/d_pizza/pizzaOrderResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
