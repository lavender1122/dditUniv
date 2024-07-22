<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css" rel="stylesheet" media="screen" />
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<html>
<head>

<style type="text/css">
.divSuburb {
    margin: auto;
    min-height: 678px;
    width: 80%;
}

.card-header {
    background-color: white;
}

.btnbtn {
    text-align: center;
}

.btncli {
    width: 105px;
    margin: auto;
    display: inline-block;
}

.btn-block+.btn-block {
    margin-top: 0;
}

h3 {
    color: black;
    margin-bottom: 30px;
    margin-top: 40px;
    margin-left: 165px;
} 

.hea {
    width: 70%;
    float: left;
}

.der {
    width: 28%;
    float: right;
}
 .card-body {
   padding: 2.25rem;
}
.card-header {
   padding: .75rem 2.25rem;
}
</style>
</head>
<body>
<sec:authorize access="isAnonymous()">
	<script type="text/javascript">
		location.href="/login";
	</script>
</sec:authorize>
<h3>공지사항 작성</h3>
<br>
<div class="card card-outline card-info divSuburb">
    <form id="frm" name="frm" action="/commonNotice/createAdm?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
        <div class="card-body">
            <div class="hea">
                <label for="subject">제목</label> 
                <input type="text" id="subject" class="form-control" name="comNotName" 
                    maxlength='45' placeholder="제목을 입력하세요." required/>
            </div>  
                
            <div class="der">
                <label for="gubun">구분</label> 
                <select title="구분 선택" id="gubun" name="comGubun" class="selectSearch form-control" disabled>
                    <option value="일반" selected="selected">일반</option> <!-- 관리자일때 학과로 고정 -->
                    <option value="학과">학과</option>     
                </select>
            </div>
        </div>
		<br>
        <div class="card-body">
            <label for="cttf">내용</label>
            <div id="ckClassic"></div>
            <textarea name="comNotCon" class="form-control" id="cttf" placeholder="내용을 입력하세요." style="display: none;" required></textarea>
        </div>

        <div class="card-header">
            <div class="custom-file">
                <input type="file" name="comAttFile" class="custom-file-input" id="customFile" multiple/>  <!-- input,label 순서 고정 -->
                <label class="custom-file-label" for="customFile">첨부파일</label>
            </div>
        </div>
        
        <div class="card-header btnbtn" style="margin-left:140px;">
            <button type="button" class="btn btn-block btn-outline-primary btncli" id="btnregi">등록</button>
            <button type="button" class="btn btn-block btn-outline-secondary btncli" id="btncanc">취소</button>
            <button type="button" class="btn btn-outline-light" id="auto">자동 완성</button>
        </div>
        <sec:csrfInput />
    </form>
</div>

<script type="text/javascript">
ClassicEditor.create(document.querySelector("#ckClassic"), {
    ckfinder: {
        uploadUrl: '/image/upload?${_csrf.parameterName}=${_csrf.token}'
    }
})
.then(editor => {
    window.editor = editor;
})
.catch(err => {
    console.error(err.stack);
});

$(function(){
	
	$('#auto').on('click', function(){
		$('#subject').val('군 복무 취득학점 인정제 안내')
		editor.setData(`병역법에 따라 입영 및 복무로 인해 입대휴학한 학생이 입대휴학 기간 동안 해당 기관에서 취득한 학점을 본교 학점으로 인정하는 제도.<br><br>

				 ■ 신청 대상: 신청학기에 제대복학한 재학생(※휴학생 신청 불가능)<br><br>

				 ■ 인정기준<br>

				    &nbsp;&nbsp;&nbsp;&nbsp;◌고등교육법 제23조 제1항 제5호에 따른 교육·훈련과정을 이수하였을 때 해당 학기 전공 또는 자유선택 학점(P)으로 인정[신청서식: 군 복무 중 취득학점인정 신청서(첨부: 국가평생교육진흥원 발급 증명서)]<br>

				    &nbsp;&nbsp;&nbsp;&nbsp;◌고등교육법 제23조 제1항 제6호에 따라 군복무경험 학점인정과정을 이수한 경우, 각 과목당 최대 2학점까지 해당 학기 교양(사회봉사, 리더십, 인성교육)학점(P)으로 인정[신청서식: 군 복무 중 취득학점인정 신청서(첨부: 군 경력증명서-“사회봉사”,“리더십”,“인성교육”문구가 필히 명시된 경우에 한정)]<br><br>

				 ■ 신청 방법<br><br>

					 &nbsp;&nbsp;&nbsp;&nbsp;◌ 군 복무 중 취득한 학점을 인정받고자 하는 학생은 복학 후 1개월 이내에 붙임의 “군 복무 중 취득학점인정 신청서”와 관련 서류를 스톡스대학을 경유하여 해당 학과(부) 제출<br>.
	
					 &nbsp;&nbsp;&nbsp;&nbsp;◌ 해당 학부(과) 군 복무 중 취득학점인정 신청서 수합 → 학사지원과 전자문서(공문) 제출.<br><br>	

				■ 신청 기간: 복학 후 1개월 내 군 복무 중 취득학점인정 신청서 제출`);
	})
	
	
	//ckeditor 내용 => textarea로 복사
	$(".ck-blurred").keydown(function(){
		console.log("str : " + window.editor.getData());
		
		$("#cttf").val(window.editor.getData());
	});

	$(".ck-blurred").on("focusout",function(){
		$("#cttf").val(window.editor.getData());
	});
	
	//높이를 480으로 고정 입력이 480을 넘으면 스크롤이 생김
	$('style').append('.ck-content { height: 480px; }');

	objEditor = editor;


    // 첨부파일 이름 바뀌는거
    document.querySelector('#customFile').addEventListener('change', function (e) {
    	let files = document.getElementById("customFile").files;
    	console.log("files : ", files);
		
		let fileName = "";
		
    	for (let i = 0; i < files.length; i++) {
    		if(i == (files.length-1)) {
    			fileName += files[i].name;
    		} else {
	    		fileName += files[i].name + ", ";
    		}
		}
    	console.log("fileName >> ", fileName);
    	
    	let nextSibling = e.target.nextElementSibling;
		nextSibling.innerText = fileName;
    });
    
    $("#btncanc").on("click", function(){
        location.href = "/commonNotice/listAdm?menuId=annNotIce";
    });
    

    $("#btnregi").on("click", function(event){
        
    	let subject = $('#subject').val();
    	let subjectTrim = subject.trim();
    	console.log("subjectTrim =>",subjectTrim);

	    if (subjectTrim === '') {
	        return; 
	    }
    	
	    console.log("내용:",editor.getData());
	    //정규표현식 적용
	    
        let nhStr = editor.getData().match(/<p>(.*)<\/p>/)[1];
        console.log(nhStr);
        nhStr = nhStr.replaceAll("&nbsp;","").trim();

        if(!nhStr){
            return;
        }
	    
        Swal.fire({
            title: '등록하시겠습니까?',
            text: "등록하면 목록으로 이동합니다.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '등록',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 폼 제출
            	Swal.fire({
          		  title: "등록 성공!",
          		  text: "목록으로 이동합니다",
          		  icon: "success"
          		}).then((result) => {
	               $("#frm").submit();
                });
            }else {
            	return; 
            }
            	
        });
    });
});
</script>
</body>
</html>
