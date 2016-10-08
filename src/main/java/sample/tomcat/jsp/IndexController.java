/*
 * Copyright 2012-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package sample.tomcat.jsp;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Controller
public class IndexController {

    @Value("${application.message:Hello World}")
    private String message = "Hello World";

    @Autowired
    private VoteRepository voteRepository;

    @Autowired
    private VerifyRecaptcha verifyRecaptcha;

    @GetMapping("/")
    public String index(Map<String, Object> model) {
        model.put("time", new Date());
        model.put("message", this.message);
        return "index";
    }

    @GetMapping("/share")
    public String share() {
        return "share";
    }

    @PostMapping("/")
    public String post(HttpServletRequest request) {
        try {
            boolean verify = verifyRecaptcha.verify(request.getParameter("g-recaptcha-response"));
            if(verify) {
                String ipAddress = request.getHeader("X-FORWARDED-FOR");
                if (ipAddress == null) {
                    ipAddress = request.getRemoteAddr();
                }
                Vote vote = new Vote(request.getParameter("party"), request.getParameter("email"), ipAddress);

                voteRepository.save(vote);
            }
        } catch (IOException e) {
        }
        return "share";
    }

}
