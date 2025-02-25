
var d  = [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
[2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
[3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
[4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
[5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
[6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
[7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
[8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]];


// The permutation table
var p =[
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
[1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
[5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
[8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
[9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
[4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
[2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
[7, 0, 4, 6, 9, 1, 3, 2, 5, 8]];


// The inverse table
var inv = [0, 4, 3, 2, 1, 5, 6, 7, 8, 9];



//  For a given number generates a Verhoeff digit

//         Validates that an entered number is Verhoeff compliant.

function  validateVerhoeff(num){
   
//    num=document.forms[0].aadharCardNo.value;
   
    var cc;
    var c = 0;

    var myArray = StringToReversedIntArray(num);


    for (var i = 0; i < myArray.length; i++)
    {

        c = d[c][p[(i % 8)][myArray[i]]];

    }

    cc=c;
  
    if(cc==0){
        //alert("Valid UID");
        return true;
    }
                
    else{
        alert("Invalid Aadhar Card No");
        return false;
        
    }
  
}



/*
             * Converts a string to a reversed integer array.
             */
function StringToReversedIntArray(num){

    var myArray = [num.length];

    for(var i = 0; i < num.length; i++)
    {

        myArray[i] = (num.substring(i, i + 1));

    }

    myArray = Reverse(myArray);


    return myArray;

}

/*
             * Reverses an int array
             */
function Reverse(myArray)
{

    var reversed = [myArray.length];

    for(var i = 0; i < myArray.length ; i++)
    {
        reversed[i] = myArray[myArray.length - (i + 1)];

    }

    return reversed;
}
   

      
