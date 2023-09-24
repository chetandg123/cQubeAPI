package helpers;

public class validation_functions {
    
    // public static void main(String[] args) {
    //     int number = 5; // Replace 5 with the desired number to be checked
    //     verifyNumber(number);
    // }

    public static void verifyNumber(int number) {
        if (number > 0) {
            System.out.println("Schemas are inserted to Database");
        } else if (number == 0) {
            System.out.println("Schemas are not inserted to Database ");
        } 
    }
}
