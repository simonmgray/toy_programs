#!/usr/bin/perl
use warnings;
use strict;

################################################
####            The R, P, S Game            ####
####                  aka                   ####
#### Simon Gray's pathetic attempt at Bayes ####
################################################

##########
## Declarations
##########
my $theta=0;
my $input=0;

my @post_num_2D_array=();
my @post_2D_array=();

my $input_j=0;

my $P_R2=0;
my $P_P2=0;
my $P_S2=0;

my $max=0;
my $max_name=0;

my $computer_throw=0;

my $human_score=0;
my $computer_score=0;

my $human_wins=0;
my $computer_wins=0;

#########
##Subroutine throwindex: converts r,p, or s into indices 0, 1, or 2, respectively; $t_i is the throw index that is returned. INPUT is the string 'r', 'p', or 's' (aka $input)
#########

sub throwindex($){
    my $throw_val = shift;
    my $t_i=0;
    if($throw_val eq 'r'){
        $t_i=0;
    }
    elsif($throw_val eq 'p'){
        $t_i=1;
    }
    else{
        $t_i=2;
    }
    return $t_i;
}

#########
##Subroutine randomthrow: gives a 'random' throw based on the units digit of seconds in time. It's not really random, but the player would not be able to predict the computers throw without knowing the underlying code.
#########

sub randomthrow(){
    my $t_input = 0;
    $t_input = time;
    
    my $lasttwo=0;
    
    $lasttwo = substr($t_input, -1);
    
    if($lasttwo <= 3){
        return 'r';
    }
    elsif($lasttwo >= 7){
        return 'p';
    }
    else{
        return 's';
    }
}


##########
#Generate initial prior array (P(R1), P(P1), P(S1)) for 1st throw of game assuming equal chance R1, P1, S1.
##########
my @prior_1D_array=();
@prior_1D_array = (1/3, 1/3, 1/3);

##########
#Create initial history 2D array with 1 in each element to initialize game: 3x3 2D array containing history of throws. Rows are the previous throw R1, P1, S1; columns are the current throw R2, P2, S2.
##########
my @history_2D_array=();

my $i=0;
my $j=0;

for($i=0;$i<3;$i++){
    for($j=0;$j<3;$j++){
        $history_2D_array[$i][$j] = 1;
    }
}

##########
#Generate initial likelihood 2D array called 'lik_2D_array' using history_2D_array data
##########
my @lik_2D_array=();

for($i=0;$i<3;$i++){
    for($j=0;$j<3;$j++){
        $lik_2D_array[$i][$j] = $history_2D_array[$i][$j]/($history_2D_array[$i][0] + $history_2D_array[$i][1] + $history_2D_array[$i][2]);
    }
}

###########
## Introduce the game
###########

print "\n\nThis is the rock, paper, scissors game. To play, type r, p, or s and press enter. The computer will throw instantaneously when you press enter. This program can only interpret r, p, or s\n";

#Two throws are required to initialize the game. The computer responds with two random throws. All subsequent throws are based on a Bayesian prediction

##########
#Request throw1, which we call $theta
##########
print "\nRock (Type 'r'), Paper (Type 'p') or Scissors (type 's')?\n";
chomp($theta = <STDIN>);

#Generate random computer throw1
$computer_throw = &randomthrow();

##########
## Display human throw1 (here $theta) and $computer_throw
##########

print "\nYou threw " . $theta . "\n";
print "The computer threw " . $computer_throw . "\n";

##########
## Determine winner and tally score: note this code uses $theta not $input
##########

if($computer_throw eq $theta){
    print "\nTie! No winner is recorded\n"
}
elsif($computer_throw eq 'r' and $theta eq 'p'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
elsif($computer_throw eq 'r' and $theta eq 's'){
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}
elsif($computer_throw eq 'p' and $theta eq 'r'){
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}
elsif($computer_throw eq 'p' and $theta eq 's'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
elsif($computer_throw eq 's' and $theta eq 'r'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
else{
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}

##########
## Display human / computer win percentages
##########

if($human_score > 0 or $computer_score > 0){
    $human_wins = 100 * $human_score / ($human_score + $computer_score);
    $computer_wins = 100 * $computer_score / ($human_score + $computer_score);
    
    print "\n";
    print "Your overall win % is: " . $human_wins . "%\n";
    print "Computer overall win % is: " . $computer_wins . "%\n";
    print "\n";
}


###########
#Request throw2, which we call $input
###########
print "\nRock (Type 'r'), Paper (Type 'p') or Scissors (type 's')?\n";
chomp($input = <STDIN>);

#Generate random computer throw1
$computer_throw = &randomthrow();

##########
## Display human throw2 (here $input) and $computer_throw
##########

print "\nYou threw " . $input . "\n";
print "The computer threw " . $computer_throw . "\n";

##########
## Determine winner and tally score: note this code uses $input
##########

if($computer_throw eq $input){
    print "\nTie! No winner is recorded\n"
}
elsif($computer_throw eq 'r' and $input eq 'p'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
elsif($computer_throw eq 'r' and $input eq 's'){
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}
elsif($computer_throw eq 'p' and $input eq 'r'){
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}
elsif($computer_throw eq 'p' and $input eq 's'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
elsif($computer_throw eq 's' and $input eq 'r'){
    $human_score = $human_score + 1;
    print "\nYou won this game!\n"
}
else{
    $computer_score = $computer_score + 1;
    print "\nThe computer won this game!\n"
}

##########
## Display human / computer win percentages
##########

if($human_score > 0 or $computer_score > 0){
    $human_wins = 100 * $human_score / ($human_score + $computer_score);
    $computer_wins = 100 * $computer_score / ($human_score + $computer_score);
    
    print "\n";
    print "Your overall win % is: " . $human_wins . "%\n";
    print "Computer overall win % is: " . $computer_wins . "%\n";
    print "\n";
}


########################
###START LOOPING HERE###
########################

#This loop will continue to ask for <STDIN> until the user types 'quit'
while($input gt ''){
    if($input eq 'quit'){
        last;
    }
    else{
        
        ###########
        ##Calculate posterior numerator 2D array called 'post_2D_array'
        ###########
        
        for($i=0;$i<3;$i++){
            for($j=0;$j<3;$j++){
                $post_num_2D_array[$i][$j] = $prior_1D_array[$i] * $lik_2D_array[$i][$j];
            }
        }
        
        ##########
        ##Calculate posterior = prior*lik / (sum (prior*lik)) = UPDATED_prior_1D_array
        ##NOTE that iteration is $j first, then $i to calculate posterior
        ##########
        
        for($j=0;$j<3;$j++){
            for($i=0;$i<3;$i++){
                $post_2D_array[$i][$j] = $post_num_2D_array[$i][$j] / ($post_num_2D_array[0][$j] + $post_num_2D_array[1][$j] + $post_num_2D_array[2][$j]);
            }
        }
        
        ##########
        ##Define new prior = posterior for throw2 (which is $input).
        ##########
        
        $input_j = &throwindex($input);
        
        for($i=0;$i<3;$i++){
            $prior_1D_array[$i] = $post_2D_array[$i][$input_j];
        }
        
        ##########
        ##Update history array: 3x3 2D array containing history of throws. Rows are the previous throw R1, P1, S1; columns are the current throw R2, P2, S2. If the previous throw was rock (R1) and the current throw is rock (R2), then 1 is added to R1,R2 location (ie index 0,0). If the previous throw was scissors (S1) and the current throw is paper (P2), then 1 is added to S1,P2 (ie index 2,1). NOTE that the $input = throw2 (ie R2, P2, or S2).
        ##########
        
        #Remember the previous throw1 (ie R1, P1, or S1) is called 'theta', the current throw2 (ie R2, P2, S2) is called $input.
        
        #This updates values in the 'r1' array [0][x] where the previous throw 'theta' was r (ie r1). Index 0 = 'r2', index 1 = 'p2', index 2 = 's2'
        if($theta eq 'r'){
            if($input eq 'r'){
                $history_2D_array[0][0]=$history_2D_array[0][0]+1;
            }
            elsif($input eq 'p'){
                $history_2D_array[0][1]=$history_2D_array[0][1]+1;
            }
            else{
                $history_2D_array[0][2]=$history_2D_array[0][2]+1;
            }
        }
        #This updates values in the 'p1' array [1][x] where the previous throw 'theta' was p (ie p1). Index 0 = 'r2', index 1 = 'p2', index 2 = 's2'
        elsif($theta eq 'p'){
            if($input eq 'r'){
                $history_2D_array[1][0]=$history_2D_array[1][0]+1;
            }
            elsif($input eq 'p'){
                $history_2D_array[1][1]=$history_2D_array[1][1]+1;
            }
            else{
                $history_2D_array[1][2]=$history_2D_array[1][2]+1;
            }
        }
        #This updates values in the 's1' array [2][x] where the previous throw 'theta' was s (ie s1). Index 0 = 'r2', index 1 = 'p2', index 2 = 's2'
        else{
            if($input eq 'r'){
                $history_2D_array[2][0]=$history_2D_array[2][0]+1;
            }
            elsif($input eq 'p'){
                $history_2D_array[2][1]=$history_2D_array[2][1]+1;
            }
            else{
                $history_2D_array[2][2]=$history_2D_array[2][2]+1;
            }
        }
        
        ##########
        #Updating the likelihood 2D array called 'lik_2D_array'
        #NOTE: Variable declarations made when lik_2D_array was 1st generated
        ##########
        
        for($i=0;$i<3;$i++){
            for($j=0;$j<3;$j++){
                $lik_2D_array[$i][$j] = $history_2D_array[$i][$j]/($history_2D_array[$i][0] + $history_2D_array[$i][1] + $history_2D_array[$i][2]);
            }
        }
        
        ##########
        ##Calculating P(R2), P(P2), P(S2) using updated prior and updated likelihoods
        ##Remember that the updated prior is the posterior for the $input throw2
        ## P(R2) = P(R1)*P(R2|R1) + P(P1)*P(R2|P1) + P(S1)*P(R2|S1)
        ## P(P2) = P(R1)*P(P2|R1) + P(P1)*P(P2|P1) + P(S1)*P(P2|S1)
        ## P(S2) = P(R1)*P(S2|R1) + P(P1)*P(S2|P1) + P(S1)*P(S2|S1)
        ##########
        
        $P_R2 = $prior_1D_array[0]*$lik_2D_array[0][0] + $prior_1D_array[1]*$lik_2D_array[1][0] + $prior_1D_array[2]*$lik_2D_array[2][0];
        
        $P_P2 = $prior_1D_array[0]*$lik_2D_array[0][1] + $prior_1D_array[1]*$lik_2D_array[1][1] + $prior_1D_array[2]*$lik_2D_array[2][1];
        
        $P_S2 = $prior_1D_array[0]*$lik_2D_array[0][2] + $prior_1D_array[1]*$lik_2D_array[1][2] + $prior_1D_array[2]*$lik_2D_array[2][2];
        
        ##########
        ## Find max of $P_R2, $P_P2, $P_S2.
        ## NOTE: If the max is two equal probabilities, this just chooses the first in order R2, P2, S2.
        ##########
        
        $max = $P_R2;
        $max_name = 'R2';
        
        if($P_P2 > $max){
            $max = $P_P2;
            $max_name = 'P2';
        }
        if($P_S2 > $max){
            $max = $P_S2;
            $max_name = 'S2';
        }
        
        ##########
        ## Choose computer throw to beat $max_name
        ##########
        
        if($max_name eq 'R2'){
            $computer_throw = 'p';
        }
        elsif($max_name eq 'P2'){
            $computer_throw = 's';
        }
        else{
            $computer_throw = 'r'
        }
        
        ############
        ## Update $theta with $input
        ############
        
        $theta = $input;
        
        ##########
        ## Request player to make throw2
        ##########
        
        print "\nRock (Type 'r'), Paper (Type 'p') or Scissors (type 's')? (Type quit to end)\n";
        chomp($input = <STDIN>);
        
        ##########
        ## Display $computer_throw
        ##########
        
        print "\nYou threw " . $input . "\n";
        print "The computer threw " . $computer_throw . "\n";
        
        ##########
        ## Determine winner and tally score
        ##########
        
        if($computer_throw eq $input){
            print "\nTie! No winner is recorded\n"
        }
        elsif($computer_throw eq 'r' and $input eq 'p'){
            $human_score = $human_score + 1;
            print "\nYou won this game!\n"
        }
        elsif($computer_throw eq 'r' and $input eq 's'){
            $computer_score = $computer_score + 1;
            print "\nThe computer won this game!\n"
        }
        elsif($computer_throw eq 'p' and $input eq 'r'){
            $computer_score = $computer_score + 1;
            print "\nThe computer won this game!\n"
        }
        elsif($computer_throw eq 'p' and $input eq 's'){
            $human_score = $human_score + 1;
            print "\nYou won this game!\n"
        }
        elsif($computer_throw eq 's' and $input eq 'r'){
            $human_score = $human_score + 1;
            print "\nYou won this game!\n"
        }
        else{
            $computer_score = $computer_score + 1;
            print "\nThe computer won this game!\n"
        }
        
        ##########
        ## Display human / computer win percentages
        ##########
        
        if($human_score > 0 or $computer_score > 0){
            $human_wins = 100 * $human_score / ($human_score + $computer_score);
            $computer_wins = 100 * $computer_score / ($human_score + $computer_score);
            
            print "\n";
            print "Your overall win % is: " . $human_wins . "%\n";
            print "Computer overall win % is: " . $computer_wins . "%\n";
            print "\n";
        }
    }
}
