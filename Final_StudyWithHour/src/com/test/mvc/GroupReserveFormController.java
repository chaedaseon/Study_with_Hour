/*==================================
	GroupReserveFormController.java
	- 사용자 정의 컨트롤러 클래스
===================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.
//    cf.Controller Annotation 활용
public class GroupReserveFormController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// session 설정
		/*
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		*/
		
		CafeDAO dao = new CafeDAO();
		ArrayList<CafeDTO> cafe = new ArrayList<CafeDTO>();
		
		try
		{
			String grCode = request.getParameter("grCode");
			String srCode = request.getParameter("srCode");
			String scCode = request.getParameter("scCode");
			String reserveDate = request.getParameter("reserveDate");
			String reserveAddr1 = request.getParameter("reserveAddr1");
			String reserveAddr2 = request.getParameter("reserveAddr2");
			String reserveHour1 = request.getParameter("reserveHour1");
			String reserveHour2 = request.getParameter("reserveHour2");
			String reserveCount = request.getParameter("reserveCount");
			
			dao.connection();
			
			cafe = dao.roomInfoList(srCode);
			
			System.out.println(scCode);
			System.out.println(srCode);
			System.out.println(reserveDate);
			System.out.println(reserveAddr1);
			System.out.println(reserveAddr2);
			System.out.println(reserveHour1);
			System.out.println(reserveHour2);
			System.out.println(reserveCount);
			
			mav.addObject("cafe", cafe);
			mav.addObject("reserveDate", reserveDate);
			mav.addObject("reserveAddr1", reserveAddr1);
			mav.addObject("reserveAddr2", reserveAddr2);
			mav.addObject("reserveHour1", reserveHour1);
			mav.addObject("reserveHour2", reserveHour2);
			mav.addObject("reserveCount", reserveCount);
			mav.setViewName("ReservationInfo.jsp");
			
			dao.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		return mav;
		
	}

}
