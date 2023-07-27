package com.hotelsolution.fire.interceptor;

import com.hotelsolution.fire.member.vo.MemberVo;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckSessionInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        if(session == null){
            response.sendRedirect(request.getContextPath() + "/member/login");
            return false;
        }

        MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/member/login");
            return false;
        }
        return true;
    }


}
