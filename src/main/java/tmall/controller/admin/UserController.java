package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.User;
import tmall.pojo.extension.UserExtension;
import tmall.util.Pagination;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class UserController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<User> users = userService.list("pagination", pagination);
        model.addAttribute("users", users);
        return "/admin/listUser";
    }
    @RequestMapping("/adminAdd")
    public String adminAdd(String name ,String password , String group , Model model) throws Exception {
        String msg = null;
        if(userService.isExist(name)){
            msg = "用户名已存在，无法注册，请重新输入";
        }
        if (msg != null ) {
            model.addAttribute("msg",msg);
            return "register";
        }

        User user = new User();
        if(group.equals("admin")){
            user.setGroup(User.Group.admin);
        }else if(group.equals("user")){
            user.setGroup(User.Group.user);
        }else{
            user.setGroup(User.Group.superAdmin);
        }
        user.setName(name);
        user.setPassword(password);
        userService.add(user);
        return "redirect:/admin/user/list";
    }

    @RequestMapping("delete")
    public String delete(int id) throws Exception {
        User user = (User) userService.get(id);
        userService.delete(user);
        return "redirect:/admin/user/list";
    }
}
