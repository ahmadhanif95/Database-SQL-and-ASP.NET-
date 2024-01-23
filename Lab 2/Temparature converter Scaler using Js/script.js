function fun1() 
{
    var dom1= document.getElementById('cen');
    var dom2= document.getElementById('far');
    var val1 = ((dom1.value *9 / 5 )+ 32);
   dom2.value =val1;
}
function fun2() {
    var dom1= document.getElementById('far');
    var dom2= document.getElementById('cen');
    var val1 = ((dom1.value - 32) * (5/9));
   dom2.value =val1;
}


