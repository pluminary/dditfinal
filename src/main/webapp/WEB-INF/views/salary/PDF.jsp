<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/resources/js/html2canvas.js"></script>
	<script src="/resources/js/jspdf.min.js"></script>
    <meta charset="UTF-8">
    <title>급여 명세서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Viewport Height */
            background-color: #f9f9f9;
        }
        .container {
            width: 90%; /* 화면 크기에 맞게 너비 조정 */
            background-color: #f2f2f2;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
        }
        .title {
            text-align: center;
            font-size: 32px; /* 폰트 크기 조정 */
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .header-left {
            display: flex;
            align-items: center;
            margin-right: auto;
        }
        .salary-date {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;
        }
        .salary-date label {
            font-size: 18px; /* 폰트 크기 조정 */
            font-weight: bold;
            margin-right: 10px;
            color: #555;
        }
        .salary-date select {
            font-size: 18px; /* 폰트 크기 조정 */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .salary-details {
            border: 1px solid #ddd;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            position: relative;
            margin-bottom: 20px;
            padding-bottom: 30px; /* 아래 여백 추가 */
        }
        .salary-section {
            width: 47%; /* 각 섹션 너비 조정 */
        }
        .salary-item {
            display: flex;
            justify-content: space-between; /* 요소들을 양쪽 끝에 배치 */
            margin-bottom: 10px;
            font-size: 18px; /* 폰트 크기 조정 */
            color: #555;
        }
        .salary-item .amount {
            text-align: right; /* 금액 부분을 오른쪽 정렬 */
            flex: 1; /* 남은 공간을 차지 */
        }
        .divider {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 50%;
            border-left: 1px solid #ddd;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 22px; /* 폰트 크기 조정 */
            border-top: 2px solid #ccc;
            padding-top: 10px;
            color: #555;
        }
        .custom-button {
            background-image: url('/resources/images/pdf.jpg'); /* 이미지 경로 설정 */
            background-size: contain; /* 이미지 크기 조절 */
            background-repeat: no-repeat; /* 이미지 반복 없음 */
            background-position: center; /* 이미지 중앙 정렬 */
            width: 30px; /* 버튼 너비 설정 */
            height: 30px; /* 버튼 높이 설정 */
            border: none; /* 테두리 제거 */
            cursor: pointer; /* 커서 포인터 */
        }
    </style>
</head>
<body>
    <div class="container" id="pdfDiv">
        <button type="button" class="custom-button" id="savePdf"></button>
        <div class="title">
            	급여 명세서
        </div>
        
        <div class="header">
            <div class="header-left">
                <label for="employeeName">사원 이름: </label>
                <input type="text" id="employeeName" name="employeeName" value="${salaryVO.empId}">
            </div>
        </div>
        <br>
        <br>
        <div class="salary-date">
            <label for="salaryYear">급여 년월:</label>
            <select id="salaryYear" name="salaryYear">
                <option value="2024">2024년</option>
            </select>
            <select id="salaryMonth" name="salaryMonth">
                <option value="01">1월</option>
                <option value="02">2월</option>
                <option value="03">3월</option>
                <option value="04">4월</option>
                <option value="05">5월</option>
                <option value="06">6월</option>
                <option value="07">7월</option>
                <option value="08">8월</option>
                <option value="09">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
            </select>
        </div>
        
        <div class="salary-details">
            <div class="salary-section">
                <div class="salary-item">
                    <span>기본급여:</span>
                    <span class="amount" id="salBsc">${salaryVO.salBsc}</span>
                </div>
                <div class="salary-item">
                    <span>상여금:</span>
                    <span class="amount" id="salAllowance">${salaryVO.salAllowance}</span>
                </div>
            </div>
            <div class="divider"></div>
            <div class="salary-section">
                <div class="salary-item">
                    <span>국민연금:</span>
                    <span class="amount" id="salPs">${salaryVO.salPs}</span>
                </div>
                <div class="salary-item">
                    <span
                    >건강보험:</span>
                    <span class="amount" id="salHt">${salaryVO.salHt}</span>
                </div>
                <div class="salary-item">
                    <span>고용보험:</span>
                    <span class="amount" id="salEmp">${salaryVO.salEmp}</span>
                </div>
                <div class="salary-item">
                    <span>소득세:</span>
                    <span class="amount" id="salTex">${salaryVO.salTex}</span>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <div class="footer">
            실급여액: <span id="salAs">${salaryVO.salAs}</span>
        </div>
    </div>

    <script>
$('#savePdf').click(function() { // pdf저장 button id
    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
        // 캔버스를 이미지로 변환
        var imgData = canvas.toDataURL('image/png');
        var imgWidth = 210; // 이미지 가로 길이(mm) / A4 기준 210mm
        var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
        var imgHeight = canvas.height * imgWidth / canvas.width;
        var heightLeft = imgHeight;
        var margin = 10; // 출력 페이지 여백설정
        var doc = new jsPDF('p', 'mm');
        var position = 0;
        // 첫 페이지 출력
        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
        heightLeft -= pageHeight;
        // 한 페이지 이상일 경우 루프 돌면서 출력
        while (heightLeft >= 20) {
            position = heightLeft - imgHeight;
            doc.addPage();
            doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;
        }
        // 파일 저장
        doc.save('salary.pdf');
    });
});
        $(function(){
	        $("#salaryMonth").on('change', function(){
				
				let data = $(this).val();
				console.log("data: ", data);
				
				$.ajax({
					url: "/salary/ajax",
					contentType: "application/json;charset=utf-8", 
					data: JSON.stringify(data),
					type: "post",
		            beforeSend:function(xhr){
		                 xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		              }, 
					success: function(result){
						console.log("result: ", result);
						console.log("result.salBsc: " + result.salBsc);
						$("#salBsc").text(result.salBsc);
						$("#salAllowance").text(result.salAllowance);
						$("#salPs").text(result.salPs);
						$("#salHt").text(result.salHt);
						$("#salEmp").text(result.salEmp);
						$("#salTex").text(result.salTex);
						$("#salAs").text(result.salAs);
					}
				})
	          });
        	
        })
        function addCommas(num) {
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(function(){
    $("#salaryMonth").on('change', function(){
        
        let data = $(this).val();
        console.log("data: ", data);
        
        $.ajax({
            url: "/salary/ajax",
            contentType: "application/json;charset=utf-8", 
            data: JSON.stringify(data),
            type: "post",
            beforeSend:function(xhr){
                 xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
              }, 
            success: function(result){
                console.log("result: ", result);
                console.log("result.salBsc: " + result.salBsc);

                // 숫자에 쉼표 추가
                $("#salBsc").text(addCommas(result.salBsc));
                $("#salAllowance").text(addCommas(result.salAllowance));
                $("#salPs").text(addCommas(result.salPs));
                $("#salHt").text(addCommas(result.salHt));
                $("#salEmp").text(addCommas(result.salEmp));
                $("#salTex").text(addCommas(result.salTex));
                $("#salAs").text(addCommas(result.salAs));
            }
        })
      });
    
})
    </script>
</body>
</html>
