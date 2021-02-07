package qdu.java.recruit.controller.hr;

import io.swagger.annotations.Api;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import qdu.java.recruit.constant.GlobalConst;
import qdu.java.recruit.controller.BaseController;
import qdu.java.recruit.entity.*;
import qdu.java.recruit.pojo.ApplicationPositionHRBO;
import qdu.java.recruit.service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * <p>
 * private int hrId;
 * private String hrMobile;
 * private String hrPassword;
 * private String hrName;
 * private String hrEmail;
 * private String description;
 * private int departmentId;
 * </p>
 */
@Controller
@Api(value = "HR接口")
public class HRController extends BaseController {

    protected Logger logger = LogManager.getLogger(getClass());

    @Autowired
    HRService hrService;

    @Autowired
    ApplicationService applicationService;

    @Autowired
    PositionService positionService;

    @Autowired
    CompanyService companyService;

    @Autowired
    DepartmentService departmentService;
    @Autowired
    CategoryService categoryService;

    /**
     * 用户注册返回 0 -> 失败 1 -> 成功
     */


    @PostMapping("/hr/register/first")
    @ResponseBody
    public String checkCompanyCode(ModelMap map,
                                   @RequestParam String CompanyCode,
                                   HttpServletRequest request,
                                   DepartmentEntity departmentEntity) {
        CompanyEntity companyEntity = companyService.getCompany(CompanyCode);
        if (companyEntity == null) {
            throw new RuntimeException("公司不存在");
        } else {
            List<DepartmentEntity> departmentEntities = departmentService.getDepartmentByCompany(
                    companyEntity.getCompanyId());
            map.put("departments", departmentEntities);
            request.setAttribute("department", departmentEntity.getDepartmentId());
            return hrDirect("hr/register/second");
        }
    }


    @PostMapping(value = "hr/register/second")
    @ResponseBody
    public int userRegister(@RequestParam HREntity user,
                            HttpServletRequest request) {

        int deparmentId = (int) request.getAttribute("department");
        user.setDepartmentId(deparmentId);
        String password = user.getHrPassword();

        //验证mobile 和 password是否为空
        if (user.getHrMobile() == null || user.getHrPassword() == null) {
            return 0;
        }
        if (hrService.registerHR(user)) {
            return 1;
        }
        return 1;
    }


    /**
     * 用户登录
     *
     * @param httpSession
     * @param userName
     * @param userPass
     * @return
     */
    @PostMapping(value = "hr/hr_login")
    @ResponseBody
    public int hrLogin(HttpSession httpSession,
                       @RequestParam String userName,
                       @RequestParam String userPass) {

        if (userName == null || userPass == null) {
            return 0;
        }
        if (hrService.loginHR(userName, userPass)) {

            httpSession.setAttribute("hr", hrService.getHRByName(userName));
            return 1;
        }
        return 0;
    }


    /**
     * 用户个人信息 输出
     *
     * @param request
     * @return
     */
    @PostMapping(value = "hr/info")
    @ResponseBody
    public String showInfo(HttpServletRequest request) {

        HREntity hr = this.getHR(request);
        if (hr == null) {
            this.errorDirect_404();
            //其实应该返回的是401，或者403
        }


        int id = hr.getHrId();

        //收件箱
        List<ApplicationPositionHRBO> applyPosList = applicationService.listApplyInfoByHr(id);

        //创建的职位
        List<PositionEntity> positionEntities = positionService.listPositionByHr(id);

        Map output = new TreeMap();
        output.put("hr", hr);
        output.put("applyPosList", applyPosList);
        output.put("positions", positionEntities);

        JSONObject jsonObject = JSONObject.fromObject(output);

        return jsonObject.toString();
    }

    /**
     * <p>
     * private int hrId;
     * private String hrMobile;
     * private String hrPassword;
     * private String hrName;
     * private String hrEmail;
     * private String description;
     * private int departmentId;
     * </p>
     * 个人信息更新 功能
     *
     * @param request
     * @param password
     * @param name
     * @param mobile
     * @param email
     * @return
     */
    @PostMapping("/hr/info/update")
    @ResponseBody
    public int updateInfo(HttpServletRequest request,
                          @RequestParam("hrMobile") String mobile,
                          @RequestParam("hrPassword") String password,
                          @RequestParam("hrName") String name,
                          @RequestParam("hrEmail") String email) {

        int hrId = this.getHRId(request);

        HREntity e = new HREntity();
        e.setHrId(hrId);
        e.setHrPassword(password);
        e.setHrName(name);
        e.setHrEmail(email);
        System.out.println("aaaa");
        if (!hrService.updateHR(e)) {
            System.out.println("bbbb");
            return 0;
        }
        return 1;
    }

    /**
     * 用户注销 功能
     *
     * @param request
     * @return
     */
    @PostMapping(value = "/hr/logout")
    @ResponseBody
    public String userLogout(HttpServletRequest request) {
        // 清除session
        Enumeration<String> em = request.getSession().getAttributeNames();
        while (em.hasMoreElements()) {
            request.getSession().removeAttribute(em.nextElement());
        }
        request.getSession().removeAttribute(GlobalConst.LOGIN_SESSION_KEY);
        request.getSession().invalidate();

        return "redirect:/user/login";
    }

    @PostMapping(value = "/hr/position/delete/{id}")
    @ResponseBody
    public int deletePosition(HttpServletRequest request, @PathVariable int id) {
        int res = positionService.deletePosition(id);
        if (res > 0) {
            return 1;
        }
        return 0;
    }

    @GetMapping(value = "/hr/position/{id}")
    @ResponseBody
    public String getPosition(HttpServletRequest request, @PathVariable int id) {

        PositionEntity position = positionService.getPositionById(id);

        //所属部门信息
        DepartmentEntity department = departmentService.getDepartment(position.getDepartmentId());
        //所属公司信息
        CompanyEntity company = companyService.getCompany(department.getCompanyId());
        //职位所属分类信息
        CategoryEntity category = categoryService.getCategory(position.getCategoryId());
        //分页评论信息

        if (!positionService.updateHits(id)) {
            this.errorDirect_404();
        }

        Map output = new TreeMap();
        output.put("position", position);
        output.put("department", department);
        output.put("company", company);
        output.put("category", category);

        JSONObject jsonObject = JSONObject.fromObject(output);

        return jsonObject.toString();
    }


}
