%% @author gaston and shiraz
%% @doc @todo Add description to twoerverclient.


-module(twoerverclient).


%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,server/0,server1/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================


%% the first server
 server()  -> 
	
	
	receive  {power,X,Y,Return_PID} -> 
				 				 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:pow(X, Y)] ) , 

						 timer:sleep(1),
					server();
			
			{abs,X,Y,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,abs(X -Y)] ) , 
	
 				timer:sleep(2),

				 server() ;
				 				
			{log,X,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:log(X)] ) , 

				 timer:sleep(3),
				 server() ;
			 Other ->
    			  io:fwrite("enter a wrong arguments"), 
				  timer:sleep(rand:uniform(10)),
 					 server()
		



	end.

%% the second server
 server1() -> 
	
	
	receive  {rectangle, Return_PID ,Width, Ht} -> 
  
				 io:format("SERVER ~w: Client request received from ~w~ Area of rectangle is ~p~n" , [self(), Return_PID,[Width * Ht]] ) , 

						 timer:sleep(1),
					server1();
			
			{pi,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:pi()] ) , 
		
 				timer:sleep(2),

				 server1() ;
				 				
			{log,X,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:log(X)] ) , 

				 timer:sleep(3),
				 server1() ;
			 Other ->
    			  io:fwrite("enter a wrong arguments"), 
				  timer:sleep(rand:uniform(10)),
				  		 server1()
		
				   
	end.

start() -> 
	  statistics(runtime), 
  	 statistics(wall_clock), 
	  
%% start calculate time 	  
Start = now(),
			timer:sleep(rand:uniform(100)),

%% for the first cliant and second sever
	Start1 = Start,
	Pid3 = spawn(twoerverclient,server1,[]),
	Pid3 ! {power, 2,9,self()}, 
	Pid3 ! {log, 150,self()}, 
	Pid3 ! {abs, 670,5000,self()}, 
	Pid3 ! {pi,self()}, 
	Pid3 ! {abs,20,59,self()}, 
	
	End1 = now(),
	Diff1 = timer:now_diff(End1, Start1) / 1000,

	io:format("CLIENT3 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff1]) ,
			timer:sleep(rand:uniform(100)),

%% for the first cliant and fisrt sever

	Start2 = Start,
	Pid2 = spawn(twoerverclient,server,[]),
	Pid2 ! {power, 2,5,self()}, 
	Pid2 ! {log, 2,self()}, 
	Pid2 ! {abs, 2,7,self()}, 
	Pid2 ! {pi,self()}, 
	Pid2 ! {abs,20,self()}, 
	End2 = now(),
Diff2 = timer:now_diff(End2, Start2) / 1000,

	io:format("CLIENT ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff2]) ,
					timer:sleep(rand:uniform(100)),

	  %% for the first cliant and second sever

	Start3 = Start,

	  	Pid1= spawn(twoerverclient,server1,[]),

		Pid1 ! {power, 5,100,self()}, 
	Pid1 ! {log, 500,self()}, 
	Pid1 ! {abs, 78,80,self()}, 
	Pid1 ! {buls,self()}, 
	Pid1 ! {abs,20,self()}, 
	End3 = now(),
	Diff3 = timer:now_diff(End3, Start3) / 1000,

	io:format("CLIENT2 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff3]) ,
	  timer:sleep(rand:uniform(100)),

				  
	  
%% end calculate time
End = now(),
%% time differance  	  
Diff = timer:now_diff(End, Start) / 1000,
io:format("The operation took: ~p milliseconds~n", [Diff]).











