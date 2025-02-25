package com.ts.controller;


import java.util.List;
import java.util.Random;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ts.model.User;
import com.ts.service.UserService;

//import com.ts.model.User;
//import com.ts.repository.UserRepository;

@Controller
public class UserController {
	
//	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	// Display the login page
	@RequestMapping({ "/", "/login" })
	public String showPage(@ModelAttribute("userCmd") User user, HttpServletRequest req, Model model) {
		Random randomGenerator = new Random();
		String code = "";
		String codeGen = "";
		String randomInt = null;
		HttpSession session = req.getSession();
		for (int idx = 1; idx <= 5; ++idx) {
			randomInt = Integer.toHexString(randomGenerator.nextInt(6));
			code = code + "" + randomInt;
			codeGen = codeGen + " " + randomInt;
		}
		if (code != null) {
			model.addAttribute("captchaCode", codeGen);
			session.setAttribute("captcha", code);
		}
		return "withLogin/UserLoginPage";
	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String authenticate(@ModelAttribute("userCmd") User user, Model model, HttpServletRequest req,
			RedirectAttributes redirectAttrs) {
		
		HttpSession session = null;
		
		String target = "login";

		try {
			session = req.getSession(false);
			
			List<Object[]> LoginUserDetails = userService.getUserInfo(user);
			System.out.println("LoginUserDetails======="+LoginUserDetails);
			
			String captchacode = user.getTxtCaptcha();
			System.out.println("captchacode=========="+captchacode);

			if (user.getTxtCaptcha() != null && user.getTxtCaptcha() != "" && user.getTxtCaptcha().equals(session.getAttribute("captcha"))) {
				if (LoginUserDetails != null && !LoginUserDetails.isEmpty() && !LoginUserDetails.contains("Invalid User")) {
					if (!LoginUserDetails.contains("N")) {
						for (Object[] result : LoginUserDetails) {
							if (result[0].toString().contains("Y")) {
								System.out.println("inside the if condition");
								session.setAttribute("districtId", result[1].toString());
								//session.setAttribute("distName", result[2].toString());
								//session.setAttribute("mandalId", result[3].toString());
								//session.setAttribute("mandalName", result[4].toString());
								//session.setAttribute("vilageId", result[5].toString());
								//session.setAttribute("vilageName", result[6].toString());
								session.setAttribute("userName", result[7].toString());
								//session.setAttribute("schoolName", result[8].toString());
								//session.setAttribute("highClass", result[9].toString());
								//session.setAttribute("lowClass", result[10].toString());
								session.setAttribute("RoleId", result[11].toString());
								//session.setAttribute("schMgt", result[12].toString());
								//session.setAttribute("schCat", result[13].toString());
								
								Vector servicesList = new Vector();
								// servicesList = userService.getUserServiceDetails(result[11].toString());
                                // System.out.println(servicesList);
								if (servicesList != null && servicesList.size() > 0) {
									// If services found
									session.setAttribute("services", servicesList);
								} else {
									Vector servicesList_static = new Vector();
									// If services not-found
									String servicedesc[] = new String[5];
									servicedesc[0] = "1";
									servicedesc[1] = "0";
									servicedesc[2] = "home.do";
									servicedesc[3] = "Home";
									servicesList_static.addElement(servicedesc);
									String servicedesc1[] = new String[5];
									servicedesc1[0] = "5";
									servicedesc1[1] = "0";
									servicedesc1[2] = "logout.do";
									servicedesc1[3] = "Logout";
									servicesList_static.addElement(servicedesc1);
									session.setAttribute("services", servicesList_static);
								}
								target = "redirect:/home";
							} else {
								redirectAttrs.addFlashAttribute("userMessage", "Invalid UserName / Password");
								target = "redirect:/login";
							}
						}
					} else {
						session.setAttribute("userId", user.getUsername());
						target = "redirect:/changePassword";
					}
				} else {
					redirectAttrs.addFlashAttribute("userMessage", "Invalid UserName / Password");
					target = "redirect:/login";
				}
			} else {
				redirectAttrs.addFlashAttribute("userMessage", "Invalid Captcha");
				target = "redirect:/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return target;
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String displaychangePassword(HttpServletRequest req, Model model, @ModelAttribute("passwordcmd") User form) {
		Random randomGenerator = new Random();
		String code = "";
		String codeGen = "";
		String randomInt = null;
		HttpSession session =  req.getSession(false);
		String username=session.getAttribute("userId")!=null?session.getAttribute("userId").toString():session.getAttribute("userName").toString();
		for (int idx = 1; idx <= 5; ++idx) {
			randomInt = Integer.toHexString(randomGenerator.nextInt(6));
			code = code + "" + randomInt;
			codeGen = codeGen + " " + randomInt;
		}
		if (code != null) {
			model.addAttribute("captchaCode", codeGen);
			model.addAttribute("passwordcmd", new User());
			model.addAttribute("user", username);
			session.setAttribute("captchapwd", code);
		}
		return "withLogin/changePassword";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest req, RedirectAttributes redirectAttrs,
			@ModelAttribute("passwordcmd") User form) {
	
		HttpSession session = null;
		session =  req.getSession(false);
        String target = "redirect:/changePassword";
      try {
			if (form.getTxtCaptcha() != null && form.getTxtCaptcha() != ""
					&& form.getTxtCaptcha().equals(session.getAttribute("captchapwd"))) {
				
				String status = userService.getChangePwdStatus(form);
				//System.out.println("==="+status+"====");
				if ("Successfully Updated PassWord".equalsIgnoreCase(status)) {
					redirectAttrs.addFlashAttribute("userMessage", status);
					session.invalidate();
					target = "redirect:/login";
				}else {
					redirectAttrs.addFlashAttribute("message", status);
				}
			} else {
				redirectAttrs.addFlashAttribute("message", "Enter Correct Captcha");
			}
		} catch (Exception ex) {
		}
		return target;
	}

	@RequestMapping(value = "/sessionExpired", method = RequestMethod.GET)
	public String sessionExpired(Model model, HttpServletRequest req) {
		return "sessionExpired";
	}

	@RequestMapping(value = "/UnAuthorized", method = RequestMethod.GET)
	public String UnAuthorizedUser() {
		return "UnAuthorizedUser";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		HttpSession oldSession = req.getSession(false);
		if (oldSession != null) {
			oldSession.removeAttribute("userName");
			oldSession.removeAttribute("RoleId");
			oldSession.invalidate();
		}
		return "redirect:/login";
	}

	@RequestMapping("/home")
	public String showWelcomePage(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String roleId = (String) ses.getAttribute("RoleId");
		if (roleId != null) {
			return "withLogin/welcome";
		} else {
			return "sessionExpired";
		}
	}
}
