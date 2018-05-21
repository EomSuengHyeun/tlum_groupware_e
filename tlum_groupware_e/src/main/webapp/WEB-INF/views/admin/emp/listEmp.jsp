<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<table>
	<tr>
		<th>사원 번호</th>
		<th>부서</th>
		<th>임직원 이름</th>
	</tr>
	<c:forEach items="${employeeList}" var="emp">
		<tr>
			<td>
				<a href="detail?emp_id=${emp.emp_id}"> ${emp.emp_id }</a>
			</td>
			<td>
				<a href="detail?emp_id=${emp.emp_id}">${emp.emp_id }</a>
			</td>
			<td>
				<a href="detail?emp_id=${emp.emp_name}">${emp.emp_name }</a>
			</td>
		</tr>
	</c:forEach>
</table>
