function validate() {   
    var x = document.getElementById("Text1").value;
    alert("Submit Sucessfully Validate called");
    
    if (x == null || x == "") 
    {
        alert('Please enter a Namee');
        document.getElementById("Text1").style.backgroundColor="red";
            
    }
    
}

function reset() {
    alert("Data Reset called");
    document.getElementById("Text1").value="";

    document.getElementById("Text1").style.backgroundColor = "white";

}
