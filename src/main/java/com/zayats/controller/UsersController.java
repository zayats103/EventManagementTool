package com.zayats.controller;

import com.zayats.dal.ApiEventRepository;
import com.zayats.dal.ApiInvitationRepository;
import com.zayats.dal.ApiUserRepository;
import com.zayats.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "home/users")
public class UsersController extends AuthorizedController {

	@Autowired
	ApiUserRepository userRepository;

	@Autowired
    ApiEventRepository apiEventRepository;

	@Autowired
	ApiInvitationRepository invitationRepository;

	@RequestMapping(value = "/delete/{userId}/{familyId}")
	public @ResponseBody
    List<Boolean> deleteUserFromFamily(@PathVariable Integer userId,
			@PathVariable int familyId, Model model, Principal principal) {
		model.addAttribute("navigation", naviMap);
		model.addAttribute("title", "Families");
		String username1 = getCurrentUser().getUsername(); // get logged in username
		model.addAttribute("username", username1);
		apiEventRepository.deleteUserFromEvent(userId, familyId);

        return Arrays.asList(new Boolean[]{true});
	}

	@RequestMapping(value = "/{userString}/{familyId}", method = RequestMethod.GET)
	public @ResponseBody
	List<User> searchUsers(@PathVariable String userString,
			@PathVariable int familyId, Model model, Principal principal) {
		return userRepository.searchUsers(userString, familyId);
	}

}
