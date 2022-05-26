package Commons.Interceptor;

import Customer.Dto.CustomerVO;
import Customer.Service.CustomerService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    @Inject
    private CustomerService customerService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object customerVO = modelMap.get("customerVO");


        logger.info("log test");
        //로그인시 받은 아이디와 비밀번호 정보를 Login 세션에 저장
        if (customerVO != null) {
            logger.info("new login success");
            httpSession.setAttribute(LOGIN, customerVO);
            System.out.println(customerVO);

            //로그인 유지 체크박스 설정시 쿠키값으로 4시간동안 유지되게 설정.
            if (request.getParameter("useCookie") != null) {
                logger.info("remember me...");
                // 쿠키 생성
                Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
                loginCookie.setPath("/");
                loginCookie.setMaxAge(60 * 60 * 4);
                // 전송
                response.addCookie(loginCookie);
            }

            Object destination = httpSession.getAttribute("destination");
            response.sendRedirect(destination != null ? (String) destination : "/index.do");
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            logger.info("clear login data before");

            Object object = httpSession.getAttribute("login");
            System.out.println(object);

            if (object != null) {
                System.out.println("object != null");
                CustomerVO customerVO = (CustomerVO) object;
                Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
                if (loginCookie != null) {
                    System.out.println("login Cookie != null");
                    loginCookie.setPath("/");
                    loginCookie.setMaxAge(0);
                    response.addCookie(loginCookie);
                    customerService.keepLogin(customerVO.getCus_id(), "none", new Date());
                    System.out.println("사용자 삭제");
                    httpSession.removeAttribute("login");
                    System.out.println("login세션 삭제");
                    httpSession.invalidate();
                    System.out.println("http invalidate");
                    if(request.isRequestedSessionIdValid() != false){
                        System.out.println("세션이 무효화 상태입니다.");
                    }
                }
            }
        }
        return true;
    }

}
