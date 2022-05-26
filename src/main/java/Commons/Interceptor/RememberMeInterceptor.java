package Commons.Interceptor;

import Customer.Dto.CustomerVO;
import Customer.Service.CustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RememberMeInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(RememberMeInterceptor.class);

    @Inject
    private CustomerService customerService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        logger.info("login cookie check");

        if (loginCookie != null) {
            logger.info("loginCookie not null");
            CustomerVO customerVO = customerService.checkLoginBefore(loginCookie.getValue());

            if (customerVO != null) {
                logger.info("customerVO not null");
                httpSession.setAttribute("login", customerVO);
            }
        }

        return true;
    }
}