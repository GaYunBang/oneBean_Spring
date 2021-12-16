function requestPay() {
    var form = document.order_form;
    if (!form.payName.value) {
        swal({
            title: "성함을 입력해 주십시오.",
            icon: "warning"
        })
        form.oname.focus();
        return false;
    }
    else if (!form.otell.value) {
        swal({
            title: "휴대폰 번호를 입력해 주십시오.",
            icon: "warning"
        })
        form.otell.focus();
        return false;
    }
    else if (!form.omail.value) {
        swal({
            title: "이메일을 입력해 주십시오.",
            icon: "warning"
        })
        form.omail.focus();
        return false;
    }
    else if (!form.ooname.value) {
        swal({
            title: "받으실분을 입력해 주십시오.",
            icon: "warning"
        })
        form.ooname.focus();
        return false;
    }
    else if (!form.ootell.value) {
        swal({
            title: "휴대폰 번호를 입력해 주십시오.",
            icon: "warning"
        })
        form.ootell.focus();
        return false;
    }    
    else if (!form.roadAddrPart1.value) {
        swal({
            title: "우편번호를 입력해 주십시오.",
            icon: "warning"
        })
        form.roadAddrPart1.focus();
        return false;
    }
    else if (!form.addrDetail.value) {
        swal({
            title: "상세주소를 입력해 주십시오.",
            icon: "warning"
        })
        form.addrDetail.focus();
        return false;
    }
    else if (!form.roadAddrPart2.value) {
        swal({
            title: "도로명/지번주소를 입력해 주십시오.",
            icon: "warning"
        })
        form.roadAddrPart2.focus();
        return false;
    }
    else if (!form.payCheck2.checked) {
        swal({
            title: "주문 상품정보에 동의해 주십시오",
            icon: "warning"
        })
        form.payCheck2.focus();
        return false;
    }
    else if (!form.payCheck3.checked) {
        swal({
            title: "결제대행 서비스 이용을 위해 개인정보 제 3자 위탁동의를 체크해 주십시오",
            icon: "warning"
        })
        form.payCheck3.focus();
        return false;
    }
    return true;
};


      function findAddr(){
        new daum.Postcode({
              oncomplete: function(data) {
                
                console.log(data);
                
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var jibunAddr = data.jibunAddress; // 지번 주소 변수
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('member_post').value = data.zonecode;
                  if(roadAddr !== ''){
                      document.getElementById("member_addr").value = roadAddr;
                  } 
                  else if(jibunAddr !== ''){
                      document.getElementById("member_addr").value = jibunAddr;
                  }
              }
          }).open();
      }
      function requestPay(){
    	  var agreeCheeck = $("#cheeck01").is(":checked");
    	  if(agreeCheeck==false){
    		  alert("동의해야 함");
    		  return false;
   			}
    	  
    	  var payType = $("input[name='payType']").val();
    	  if (payType == "무통장입금"){
        	  return true;
    	  }else if(payType == "신용카드"){

        	  return false;
    	  }
      }
      //주문자와 동일 버튼 눌렀을 때
      function sameShip(){
    	  var name = $("input[name='payName']").val();
    	  var phone = $("input[name='payPhone']").val();
    	  $("input[name='orderPostName']").val(name);
    	  $("input[name='orderPostPhone']").val(phone);
      }
      
      Number.prototype.formatNumber = function(){
  	    if(this==0) return 0;
  	    let regex = /(^[+-]?\d+)(\d{3})/;
  	    let nstr = (this + '');
  	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
  	    return nstr;
  	  };
/*동의 체크박스 js*/ 
window.onload = function(){
    var checkWrap = document.getElementById('checkWrap'),
        check = checkWrap.getElementsByTagName('input');
    checkWrap.addEventListener('click', function(e){
        var target = e.target,
            checkNum = 0;
        if(target === check[0]){
            if(target.checked){
                for(var i = 1;i < check.length;i++){
                    check[i].checked = true;
                };
            }else{
                for(var i = 1;i < check.length;i++){
                    check[i].checked = false;
                };
            };
        }else{
            for(var i = 1;i < check.length;i++){
                if(check[i].checked){
                    checkNum++;
                };
            };
            if(checkNum >= check.length - 1){
                check[0].checked = true;
            }else{
                check[0].checked = false;
            };
        };
    });
};