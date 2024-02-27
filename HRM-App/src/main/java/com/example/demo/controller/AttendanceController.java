package com.example.demo.controller;
import com.example.demo.repository.AttendanceRepository;
import com.example.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
@Controller
public class AttendanceController {
    @GetMapping("/dashboard/attendance")
    public String attendance() {
        return "attendance";
    }
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private AttendanceRepository attendanceRepository;
    @GetMapping("/attendance")
    public void attendance(@RequestParam int empId, @RequestParam(required = false) String date, @RequestParam(required = false) String date1,
                           @RequestParam(required = false) String date2, @RequestParam String type, Model model){
        LocalDate d = (date != null && !date.isEmpty()) ? LocalDate.parse(date) : LocalDate.ofEpochDay(0);
        LocalDate d1 = (date1 != null && !date1.isEmpty()) ? LocalDate.parse(date1) : LocalDate.ofEpochDay(0);
        LocalDate d2 = (date2 != null && !date2.isEmpty()) ? LocalDate.parse(date2) : LocalDate.ofEpochDay(0);
        int percentage=0;
        if (employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee not found");
        }
        else{
            if(type.equals("specific") && date!=null && validateDate(d)){
                if(attendanceRepository.present(date,empId)==1) {
                    model.addAttribute("att","Present");
                }
                else{
                    model.addAttribute("msg","On Leave");
                }
            }
            else if (type.equals("range") && date1!=null && date2!=null && validateDate(d1) && validateDate(d2)){
                if(d1==d2){
                    if(attendanceRepository.present(date,empId)==1) percentage=100;
                } else{
                    percentage=(attendanceRepository.between(d1,d2,empId)*100)/ attendanceRepository.count(d1,d2,empId);
                }
                model.addAttribute("percentage",percentage);
            }
            else if (type.equals("overall")){
                percentage=(attendanceRepository.overall(empId)*100)/attendanceRepository.length(empId);
                model.addAttribute("percentage",percentage);
            }
            else{
                model.addAttribute("msg","Invalid Date(s)");
            }
        }
    }
    public static boolean validateDate(LocalDate date){
        LocalDate currentDate = LocalDate.now();
        int presentYear = currentDate.getYear();
        int presentMonth = currentDate.getMonthValue();
        int presentDay = currentDate.getDayOfMonth();
        int year = date.getYear();
        int month = date.getMonthValue();
        int day = date.getDayOfMonth();
        if(year > presentYear) return false;
        if(year == presentYear && month > presentMonth) return false;
        if(year == presentYear && month == presentMonth && day < presentDay) return false;
        return true;
    }
}