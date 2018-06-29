var temp=0;
var temp2=0;


function take(msg1){
    temp=msg1;
}
function take2(msg){
    temp2=msg;
}            
var TableRow = {
    selected:-1,
    hoverColor:'#1B2C2D',
    defaultColor:'',
    onmouseover : function(trow,id)
    {
        if (TableRow.selected!= id)
            trow.bgColor=TableRow.hoverColor;
    },
    onmouseout : function(trow,id)
    {
        if (TableRow.selected!= id)
            trow.bgColor=TableRow.defaultColor;
    },
    onclick : function(trow,id)
    {
        if (TableRow.selected == id)
        {
            TableRow.selected = -1;
            trow.bgColor=TableRow.hoverColor;
        }
        else
        {
                        
            var r = document.getElementById('id_tablerow_'+TableRow.selected);
            if (TableRow.selected !=-1 && r)
                r.bgColor=TableRow.defaultColor;
            TableRow.selected = id;
            trow.bgColor=TableRow.hoverColor;
        }
    }
}
function changeText( txt,el_id)  
{  
    
    document.getElementById(el_id).value=txt;
} 

    
function resetall(){
   
    document.getElementById("selections").style.display="block";
    document.getElementById("update").style.display="none";
    document.getElementById("hi").style.display="none";
    document.getElementById("hi3").style.display="none";
    document.getElementById("doc").style.display="none";
               
}
function alertError(){
    if(document.form.amount.value == "" )
    {
                   
        document.form.action ="none";
        document.getElementById("doc").style.display="block";          
        return false;
    }
    else{ 
        document.getElementById("doc").style.display="none";
       
    } 
    if(document.form.amount1.value == ""){
       
        document.getElementById("doc").style.display="block";
        return false;
        
      
    }
    else{
        document.form.action ="none";
        document.getElementById("doc").style.display="none";          
        
    }
    
}
           
function isNumeric(val) {
    var valstr = val + "";
    for(var i = 0; i < valstr.length; i++) {
        if(valstr.charAt(i) < "0" || valstr.charAt(i) > "9")
            return false;
    }
    return true;
}
                      
                          
            
            
function onsubmitform(){
      
    if(document.pressed == 'Submit')
    {
        if(TableRow.selected == -1){
           
            document.getElementById('hi').style.display='block'; 
            document.form.action ="none";
            return false;
        }
        else {
            document.form.action ="approval.jsp?id="+temp;
            return true;
        }
    }
    else  if(document.pressed == 'rejection'){  
                                             
        
        if(TableRow.selected == -1){ 
            document.getElementById('hi').style.display='block'; 
            document.form.action ="none";
            return false;
        }else{
            document.form.action ="rejection.jsp?id="+temp+"&ln="+temp2;
            return true;
        }                                    
        
       
    }
    else if(document.pressed == 'update'){  
                      
        if(TableRow.selected == -1){
           
            document.getElementById('hi').style.display='block'; 
            document.form.action ="none";
            return false;
        }else{ 
            document.getElementById("selections").style.display="none";   
            document.getElementById("update").style.display="block";
            return false;
           
        }
    }
    else if(document.pressed == 'ok'){
        t=document.form.amount.value;
        if(document.form.amount.value!="" && document.form.amount1.value!="" && isNumeric(t)==true  ){ 
                                    
            document.form.action ="update.jsp?id="+temp+"&ln="+document.getElementById("amount").value+"&docum="+document.getElementById("amount1").value;
            return true;
            
        }else{
            
            t=document.form.amount.value;
            if(isNumeric(t)!=true ){
                document.form.action ="none";
                document.getElementById("hi3").style.display="block";
                return false;
              
            }else{
                document.getElementById("hi3").style.display="none";
            }
            alertError();
            return false;
        }
    }else if(document.pressed == 'back'){
        back("managerMain.jsp");
        return false;
    }



     
}
function onsuggestform(){
      
    if(document.pressed == 'Submit')
    {
        if(TableRow.selected == -1){
           
            document.getElementById('hi').style.display='block'; 
            document.form.action ="none";
            return false;
        }
        else {
            document.form.action ="suggest.jsp?id="+temp+"&ln="+document.getElementById("amount").value;
            return true;
        }
    }
    else if(document.pressed == 'update'){  
                      
        if(TableRow.selected == -1){
           
            document.getElementById('hi').style.display='block'; 
            document.form.action ="none";
            return false;
        }else{ 
            document.getElementById("selections").style.display="none";   
            document.getElementById("update").style.display="block";
            return false;
           
        }
    }
    else if(document.pressed == 'ok'){
      
        if(document.form.amount.value!="" && document.form.amount1.value!=""  ){ 
            t=document.form.amount.value;
            if(isNumeric(t)==true ){                             
                document.form.action ="edit.jsp?id="+temp+"&ln="+document.getElementById("amount").value+"&docum="+document.getElementById("amount1").value;
                return true;
            }
            else{      
                t="";
                document.form.action ="none";
                document.getElementById("doc").style.display="none";  
                document.getElementById("hi3").style.display="block";
                return false;
            }
        }else{
            
            t=document.form.amount.value;
            if(isNumeric(t)!=true ){
                document.form.action ="none";
                document.getElementById("hi3").style.display="block";
                
              
            }else{
                document.getElementById("hi3").style.display="none";
            }
            alertError();
            return false;
        }
    }else if(document.pressed == 'back'){
        back("showApplicationsForSuggestions.jsp");
        return false;
    }



     
}                     
    
            
                
              

               
function startTimer() {
    var tim = window.setTimeout("hideMessage()", 5000);  // 5000 milliseconds = 5 seconds
}
function hideMessage() {
    document.getElementById("hi2").style.display="none"; 
//window.setTimeout(window.location.replace("managerMain.jsp"),0);
}
function back(url){
    window.location.replace(url);
}

window.onload = setupRefresh();

              
    
            
            

            
            
   
       
